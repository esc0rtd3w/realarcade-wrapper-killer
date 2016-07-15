
///////////////////////////////////
//  Ivan A. Krestinin            //
//  Crown_s Soft                 //
//  http://www.crown-s-soft.com  //
///////////////////////////////////


int DeleteFileFromZIP(const char* zip_name, const char* del_file)
{
	bool some_was_del = false;

	// change name for temp file
	char* tmp_name = (char*)malloc((strlen(zip_name) + 5)*sizeof(char));
	strcpy(tmp_name, zip_name);
	strncat(tmp_name, ".tmp", 5);

	// open source and destination file
	zlib_filefunc_def ffunc;
	fill_win32_filefunc(&ffunc);

	zipFile szip = unzOpen2(zip_name, &ffunc);
	if (szip==NULL) { free(tmp_name); return -1; }
	zipFile dzip = zipOpen2(tmp_name, APPEND_STATUS_CREATE, NULL, &ffunc);
	if (dzip==NULL) { unzClose(szip); free(tmp_name); return -1; }

	// get global commentary
	unz_global_info glob_info;
	if (unzGetGlobalInfo(szip, &glob_info) != UNZ_OK) { zipClose(dzip, NULL); unzClose(szip); free(tmp_name); return -1; }

	char* glob_comment = NULL;
	if (glob_info.size_comment > 0)
	{
		glob_comment = (char*)malloc(glob_info.size_comment+1);
		if ((glob_comment==NULL)&&(glob_info.size_comment!=0)) { zipClose(dzip, NULL); unzClose(szip); free(tmp_name); return -1; }

		if ((unsigned int)unzGetGlobalComment(szip, glob_comment, glob_info.size_comment+1) != glob_info.size_comment)  { zipClose(dzip, NULL); unzClose(szip); free(glob_comment); free(tmp_name); return -1; }
	}

	// copying files
	int n_files = 0;

	int rv = unzGoToFirstFile(szip);
	while (rv == UNZ_OK)
	{
		// get zipped file info
		unz_file_info unzfi;
		char dos_fn[MAX_PATH];
		if (unzGetCurrentFileInfo(szip, &unzfi, dos_fn, MAX_PATH, NULL, 0, NULL, 0) != UNZ_OK) break;
		char fn[MAX_PATH];
		OemToChar(dos_fn, fn);

		// if not need delete this file
		if (stricmp(fn, del_file)==0) // lowercase comparison
			some_was_del = true;
		else
		{
			char* extrafield = (char*)malloc(unzfi.size_file_extra);
			if ((extrafield==NULL)&&(unzfi.size_file_extra!=0)) break;
			char* commentary = (char*)malloc(unzfi.size_file_comment);
			if ((commentary==NULL)&&(unzfi.size_file_comment!=0)) {free(extrafield); break;}

			if (unzGetCurrentFileInfo(szip, &unzfi, dos_fn, MAX_PATH, extrafield, unzfi.size_file_extra, commentary, unzfi.size_file_comment) != UNZ_OK) {free(extrafield); free(commentary); break;}

			// open file for RAW reading
			int method;
			int level;
			if (unzOpenCurrentFile2(szip, &method, &level, 1)!=UNZ_OK) {free(extrafield); free(commentary); break;}

			int size_local_extra = unzGetLocalExtrafield(szip, NULL, 0);
			if (size_local_extra<0) {free(extrafield); free(commentary); break;}
			void* local_extra = malloc(size_local_extra);
			if ((local_extra==NULL)&&(size_local_extra!=0)) {free(extrafield); free(commentary); break;}
			if (unzGetLocalExtrafield(szip, local_extra, size_local_extra)<0) {free(extrafield); free(commentary); free(local_extra); break;}
			
			// this malloc may fail if file very large
			void* buf = malloc(unzfi.compressed_size);
			if ((buf==NULL)&&(unzfi.compressed_size!=0)) {free(extrafield); free(commentary); free(local_extra); break;}

			// read file
			int sz = unzReadCurrentFile(szip, buf, unzfi.compressed_size);
			if ((unsigned int)sz != unzfi.compressed_size) {free(extrafield); free(commentary); free(local_extra); free(buf); break;}

			// open destination file
			zip_fileinfo zfi;
			memcpy (&zfi.tmz_date, &unzfi.tmu_date, sizeof(tm_unz));
			zfi.dosDate = unzfi.dosDate;
			zfi.internal_fa = unzfi.internal_fa;
			zfi.external_fa = unzfi.external_fa;

			if (zipOpenNewFileInZip2(dzip, dos_fn, &zfi, local_extra, size_local_extra, extrafield, unzfi.size_file_extra, commentary, method, level, 1)!=UNZ_OK) {free(extrafield); free(commentary); free(local_extra); free(buf); break;}

			// write file
			if (zipWriteInFileInZip(dzip, buf, unzfi.compressed_size)!=UNZ_OK) {free(extrafield); free(commentary); free(local_extra); free(buf); break;}

			if (zipCloseFileInZipRaw(dzip, unzfi.uncompressed_size, unzfi.crc)!=UNZ_OK) {free(extrafield); free(commentary); free(local_extra); free(buf); break;}

			if (unzCloseCurrentFile(szip)==UNZ_CRCERROR) {free(extrafield); free(commentary); free(local_extra); free(buf); break;}
			free(commentary);
			free(buf);
			free(extrafield);
			free(local_extra);

			n_files ++;
		}

		rv = unzGoToNextFile(szip);
	}

	zipClose(dzip, glob_comment);
	unzClose(szip);

	free(glob_comment);
	

	// if fail
	if ( (!some_was_del) || (rv!=UNZ_END_OF_LIST_OF_FILE) )
	{
		remove(tmp_name);		
		free(tmp_name);
		return -1;
	}

	remove(zip_name);
	if (rename(tmp_name, zip_name) != 0)
	{
		free(tmp_name);
		return -1;
	}

	// if all files were deleted
	if (n_files==0) remove(zip_name);

	free(tmp_name);
	return 0;
}

