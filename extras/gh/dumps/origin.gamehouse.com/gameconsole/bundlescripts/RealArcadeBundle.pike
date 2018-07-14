// RealArcadeBundle.pike
//
// $Id: $
//
// First Module to process file bundling for RealArcade
// Appends files to the RealArcade installer, and RealArcade retrieves them
//

int thread_safe=0; 
#include <module.h>

inherit "module";
inherit "roxenlib";

//constant module_type = MODULE_FIRST;
//constant module_name = "RealArcadeBundle Module";
//constant module_doc  = "Takes requests for RealArcade bundles, constructing and sending a meta file";
//constant module_unique = 1;

object incl=0, excl=0;
int redirected=0, passed=0;
string strLastStatus = "";

mixed *register_module()
{
	return ({ 
		MODULE_FIRST,
		"RealArcadeBundle Module",
		"Takes requests for RealArcade bundles, constructing and sending a meta file",
		({ }), 1
	});
}

void create() {
  defvar("MaxAge", 24 * 60,
         "Maximum age of content", TYPE_INT,
         "Bundles older than this number of minutes will be regenerated");

  defvar("strBundleName", "RealArcade.exe",
         "Name of the file returned to the user", TYPE_STRING,
         "This is the name of the file downloaded by the user.");

  defvar("strSourceBasePath", "/home/rawww/html/GameBundleFiles/",
         "Game Bundle File directory", TYPE_STRING,
         "Root directory of the files used to construct the bundle.<br>"
         "The files RealArcadeW0L0.exe, *.ini, and others live here.<br>"
         "Must end with a '/'");

  defvar("strRoxenBasePath", "/home/rawww/html/",
         "Root directory of the Roxen Server content", TYPE_STRING,
         "This is prepended to the created file names");

  defvar("strBundleFile", "RealArcadeBundle",
         "Default bundle profile", TYPE_STRING,
         "This optional parameter will have <it>.ini</it> appended to it and then be used "
         "as the name of the default file to be used as the profile file.");

  defvar("strDistCode", "W0L0", "Default Distribution Code", TYPE_STRING,
         "This value indicates the default RealArcade distribution code.");

  defvar("strBundleUrlMatch", "/RealArcadeBundle.exe",
         "Regexp Bundle Name Specification", TYPE_STRING,
         "An expression here will be used to identify requests that should be processed as bundle requests."
         "<br>Note: id->not_query is automatically lowercased");

  defvar("strBundleParamMatch", "RealArcadeBundleExt",
         "Query String parameter name for tagging bundle requests", TYPE_STRING,
         "Any request with this parameter set to '.exe' in its query string will be processed as a bundle request");
}

void start(int num, object conf) {
  catch {
    if (strlen(query("regexpinclude")))
      incl = Regexp(query("regexpinclude"));
    if (strlen(query("regexpexclude")))
      excl = Regexp(query("regexpexclude"));
  };
}


string status() {
  return (sprintf("%d handled, %d passed on. %3.2f%% of the traffic is being handled<br>Last Request:<br>%s",
                  redirected, passed, (passed > 0) ? (float)redirected / ((float)passed + (float)redirected) * 100.0 : 0.0,
		  strLastStatus));
}

mapping first_try (object id) {
  // Return zero (Unhandled) unless the filename, or a query string parameter, matches
  if ((search(id->not_query, QUERY(strBundleUrlMatch)) == -1) && (QUERY(strBundleParamMatch) != ".exe")) {
    passed++;
    return 0;
  }

  redirected++;

  string strOutFile = generate_bundle_file (id);
  
  if (strOutFile != "") {
    return http_redirect(strOutFile, id);
//  return http_file_answer(strOutFile, "application/octet-string");
  }
  return http_redirect("BundleError/FailedToGenerateFile.html?file=" + strOutFile, id);
}

string generate_bundle_file (object id) {
  // Check to see if a valid file exists for this bundle, creating one if not.
  // Files are valid for N minutes (default is one day).

  int nMaxAge = QUERY(MaxAge) * 60;

  // An 'A'/'B' sequence is used so files still being read will not conflict
  // with the creation of a new file.
  string strBundle = id->variables["bundle"] ? id->variables["bundle"] : QUERY(strBundleFile);
  string strGame = id->variables["game"] ? id->variables["game"] : "na";
  string strDistCode = id->variables["distcode"] ? id->variables["distcode"] : QUERY(strDistCode);
  string strSeq = (time() % nMaxAge >= nMaxAge / 2) ? "A" : "B";
  string strBundleDir = "Bundles/" + strBundle + "_" + strGame + "_" + strDistCode + "_" + strSeq + "/";
  string strFileName = strBundleDir + QUERY(strBundleName);
  string strFullFileName = QUERY(strRoxenBasePath) + strFileName;

  mkdir (QUERY(strRoxenBasePath) + "Bundles");
  mkdir (QUERY(strRoxenBasePath) + strBundleDir);

  // check to see if an extant copy of the file exists
  if (id->variables["ForceRegen"] &&id->variables["ForceRegen"] == "true") {
    nMaxAge = 0;  // Expire any existing file
  }
  else {
    if (is_file (strFullFileName)) {
      array(int) stats = file_stat(strFullFileName);
      if (time() >= stats[3] && (time() - stats[3]) < (nMaxAge + 10)) {
	// Use this file
	return (strFileName);
      }
    }
  }
  strFileName = gen_bundle (id, strFullFileName, strFileName, strBundle, strGame, strDistCode);
  return (strFileName);
}

string gen_bundle (object id, string strFullFileName, string strFileName, string strProfile, string strGame, string strDistCode)
{

  // File table
  class FileEntry
  {
    int  nNameStart;
    int  nNameLength;
    int  nDataStart;
    int  nDataLength;

    void SetNameStart(int x) { nNameStart = x; }
    int  GetNameStart()      { return nNameStart; }
  };
  FileEntry feDefault = FileEntry();
  feDefault->nNameStart = 0;

  array(FileEntry) Files = ({ feDefault, feDefault, feDefault, feDefault, feDefault, feDefault, feDefault, feDefault,
			      feDefault, feDefault, feDefault, feDefault, feDefault, feDefault, feDefault, feDefault,
			      feDefault, feDefault, feDefault, feDefault, feDefault, feDefault, feDefault, feDefault,
			      feDefault, feDefault, feDefault, feDefault, feDefault, feDefault, feDefault, feDefault, feDefault });


  string SourceDir  = QUERY(strSourceBasePath);
  int    nOutBytes  = 0;
  string zeros32    = "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0";

  string strUrl           = id->not_query;
  string strQuery         = id->query;

  string strRacSetupFile  = SourceDir + "RealArcade" + strDistCode + ".exe";

  // Create a new file
  object outfile = Stdio.File();
  if (outfile->open (strFullFileName + "_tmp", "wtc", 0644) == 0)
    {
      strLastStatus = "Failed to open output file: " + strFullFileName;
      return ("BundleError/UnableToCreateOutputFile.html?file=" + strFullFileName);
    }


  string contents = "Start";
  object infile = Stdio.File();
  if (infile->open (strRacSetupFile, "r") == 0)
    {
      outfile->close();
      strLastStatus = "Failed to open installer file: " + strRacSetupFile;
      return ("BundleError/NoArcadeDistribution.html?file=" + strRacSetupFile);
    }

  while (strlen(contents) > 0)
    {
      contents = infile->read(4 * 1024 * 1024);

      if (strlen (contents) > 0)
	{
	  outfile->write (contents);
	  nOutBytes += strlen(contents);
          strLastStatus = "Wrote installer file: " +  strlen(contents) + " bytes\n";
	}
    }
  infile->close();
  if (nOutBytes % 32)
    {
      int nNumZeros = 32 - (nOutBytes % 32);
      outfile->write (zeros32[0..nNumZeros - 1]);
      nOutBytes += nNumZeros;
    }

  //
  // Write out the Profile file
  //
  int nProfileStart = nOutBytes;
  string profileContents = "";
  contents = "Start";
  if (infile->open (SourceDir + strProfile + ".ini", "r") == 0)
    {
      outfile->close();
      return ("BundleError/NoProfile.html?file=" + SourceDir + strProfile + ".ini");
    }

  while (strlen(contents) > 0)
    {
      contents = infile->read(4096);

      if (strlen (contents) > 0)
	{
	  outfile->write (contents);
	  nOutBytes += strlen(contents);
          strLastStatus = "<br>Wrote profile file: " +  strlen(contents) + " bytes";

	  profileContents += contents;
	}
    }
  infile->close();
  int nProfileLength = nOutBytes - nProfileStart;

  // The first file is always the game
  string strGameFile = strGame + ".rgs";
  string strGameName = "RGS\\" + strGame + ".rgs";

  if (!is_file (strGameFile))
    {
      // this will double up on the profile file
      strGameFile = strProfile + ".ini";
      strGameName = strProfile + ".ini";
    }

  array(string) astrFile = ({ strGameFile,
			      "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
			      "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "" });
  array(string) astrDest = ({ strGameName,
			      "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
			      "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "" });

  //
  // Extract extra files list to copy from the profile file
  //
  int nFilesStart = search (profileContents, "FILE1=");
  int nProfileFiles = 0;

  if (nFilesStart > 0)
    {

      string strFiles = profileContents[nFilesStart .. strlen(profileContents) - 1];
      int nMatches = 0;

      if (strlen (strFiles) > 2)
	{
	  strFiles = replace (strFiles, "~", "_");
	  strFiles = replace (strFiles, "\r\n", "~");
	  strFiles = replace (strFiles, "~~~~", "~");
	  strFiles = replace (strFiles, "~~~", "~");
	  strFiles = replace (strFiles, "~~", "~");
	  strFiles = strFiles + "FILE99=nada~DEST99=nada~\n";

	  nMatches = sscanf (strFiles,
			     "FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~" +
			     "FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~" +
			     "FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~" +
			     "FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~" +
			     "FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~" +
			     "FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~" +
			     "FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~" +
			     "FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~FILE%*d=%s~DEST%*d=%s~",
			     astrFile[ 1], astrDest[ 1], astrFile[ 2], astrDest[ 2], 
			     astrFile[ 3], astrDest[ 3], astrFile[ 4], astrDest[ 4],
			     astrFile[ 5], astrDest[ 5], astrFile[ 6], astrDest[ 6], 
			     astrFile[ 7], astrDest[ 7], astrFile[ 8], astrDest[ 8],
			     astrFile[ 9], astrDest[ 9], astrFile[10], astrDest[10], 
			     astrFile[11], astrDest[11], astrFile[12], astrDest[12],
			     astrFile[13], astrDest[13], astrFile[14], astrDest[14], 
			     astrFile[15], astrDest[15], astrFile[16], astrDest[16],
			     astrFile[17], astrDest[17], astrFile[18], astrDest[18], 
			     astrFile[19], astrDest[19], astrFile[20], astrDest[20],
			     astrFile[21], astrDest[21], astrFile[22], astrDest[22], 
			     astrFile[23], astrDest[23], astrFile[24], astrDest[24],
			     astrFile[25], astrDest[25], astrFile[26], astrDest[26], 
			     astrFile[27], astrDest[27], astrFile[28], astrDest[28],
			     astrFile[29], astrDest[29], astrFile[30], astrDest[30], 
			     astrFile[31], astrDest[31], astrFile[32], astrDest[32]);
	}
      nProfileFiles = nMatches / 4;

      if (nProfileFiles < 1)
	{
	  outfile->close();
	  return ("BundleError/CannotReadProfile.html?text=" + strFiles);
	}
    }

  //
  // Write out the files
  //
  int nNumberFiles = 1 + nProfileFiles;  // profile plus profile files
  int nFileIndex = 0;

  strLastStatus = "<br>There are " + nNumberFiles + " files: ";
  for (nFileIndex = 0; nFileIndex < nNumberFiles; nFileIndex++)
    {
      Files[nFileIndex] = FileEntry();

      if (infile->open (SourceDir + astrFile[nFileIndex], "r") == 0)
	{
          outfile->close();
          strLastStatus += "<br> Cannot Read File #" + nFileIndex + " <" + astrFile[nFileIndex] + ">  ";
          return ("BundleError/CannotReadFile.html?index=" + nFileIndex + "&file=" + astrFile[nFileIndex]);
	}
      else
	{
	  Files[nFileIndex]->nNameStart = nOutBytes;
	  outfile->write (astrDest[nFileIndex]);
	  nOutBytes += strlen(astrDest[nFileIndex]);
	  Files[nFileIndex]->nNameLength = strlen(astrDest[nFileIndex]);
	  contents = "Start";
	  if (1)
	    {
	      string strDebug = "\0\n================================" +
		"\nnFileIndex = " + nFileIndex +
		"\nnNameStart = {" + Files[nFileIndex]->nNameStart + "}" +
		"\nnNameLength = {" + Files[nFileIndex]->nNameLength + "}\n\n\0";
	      outfile->write (strDebug);
	      nOutBytes += strlen (strDebug);
	    }
	}
  
      Files[nFileIndex]->nDataStart = nOutBytes;
      while (strlen(contents) > 0)
	{
	  contents = infile->read(4 * 1024 * 1024);

	  if (strlen (contents) > 0)
	    {
	      outfile->write (contents);
	      nOutBytes += strlen(contents);


              strLastStatus += "<br> File[" + nFileIndex + "] had " + strlen(contents) + " bytes written to it ";
	    }
	}
      infile->close();

      Files[nFileIndex]->nDataLength = nOutBytes - Files[nFileIndex]->nDataStart;
    }

  // Write out the file headers
  for (nFileIndex = 0; nFileIndex < nNumberFiles; nFileIndex++)
    {
      outfile->write (sprintf ("FILE%04d 0x%08x  0x%08x  0x%08x  0x%08x  0x00000001 ", nFileIndex,
			       Files[nFileIndex]->nNameStart, Files[nFileIndex]->nNameLength,
			       Files[nFileIndex]->nDataStart, Files[nFileIndex]->nDataLength));
    }

  // Write out the trailing header
  int    nVersion  = 0x01000002;    // version 1.0.0.2
  string strMD5    = "00000000000000000000000000000000";
  string strRSA    = "0000000000000000000000000000000000000000000000000000000000000000";

  outfile->write (sprintf ("RGBUNDLE 0x%08x  0x%08x  0x%08x  0x%08x %32.32s%64.64s",
			   nVersion, nProfileStart, nProfileLength, nNumberFiles, strMD5, strRSA));

  outfile->close();

  // Move the complete file to its valid name
  if (mv (strFullFileName + "_tmp", strFullFileName) == 0)
    {
      return ("BundleError/CannotMoveFile.html?src=" + strFullFileName + "_tmp&dest=" + strFullFileName);
    } 

  return (strFileName);
                    
}
 
#ifdef PIKE_POST70
// Needed only in post 7.0 Pike
array(int) file_stat(string path, void|int(0..1) symlink)
{
  Stdio.Stat st = predef::file_stat(path, symlink);
  if (!st) return 0;
  return (array(int))st;
}
#else
// Needed only in post 7.0 Pike
int is_file(string path)
{
  array  stat = file_stat(path);

  return (stat && stat[1] != -2);
}
#endif
