// rfstools v0.1
// esc0rtd3w 2016 / https://github.com/esc0rtd3w

#include "stdafx.h"
#include <stdio.h>
#include <iostream>
#include <windows.h>
#include <tchar.h>
#include <conio.h>
#include <strsafe.h>

#include "rfs.h"

using namespace std;

int main()
{
	class Header header;
	
	// Set Window Title
	SetConsoleTitle(TEXT("RFS Tool v0.1 Alpha                                                               " \
		"                       esc0rtd3w 2016"));



	// Header Info
	// All numerical values are in hexidecimal

	// ID, Label, Start Byte, End Byte, Number of Bytes, Raw Hex

	header.chunk0[6] = { "0", "AMRFSPKG", "0x00", "0x0f", "10", "414D524653504B470100000000000000" };
	header.chunk1[6] = { "1", "Unknown", "0x2c", "0x2f", "04", "00000000" };
	header.chunk2[6] = { "2", "Unknown", "0x10", "0x15", "06", "352A72654F" };
	header.chunk3[6] = { "3", "Unknown", "0x16", "0x27", "12", "000000000000000000000000000000000000" };
	header.chunk4[6] = { "4", "Data Size", "0x28", "0x2b", "04", "00000000" };
	header.chunk5[6] = { "5", "Unknown", "0x30", "0x31", "02", "6F14" };
	header.chunk6[6] = { "6", "Unknown", "0x32", "0x33", "02", "0000" };
	header.chunk7[6] = { "7", "Unknown", "0x34", "0x35", "02", "6F14" };
	header.chunk8[6] = { "8", "Unknown", "0x36", "0x37", "02", "0000" };
	header.chunk9[6] = { "9", "Unknown", "0x38", "0x6f", "38", "78DAABE6E55250504A4C2EC9CCCF2B56B252A806F1812205F9C5259979C52589393920D15A9070AD8E0258756A456A72694962524E2A504A" };

	

	// Print RFS Header Info
	cout << "RFS Default Header Info\n\n" << "Chunk 1: " << header.chunk0[6] << "\nChunk 2: " << header.chunk1[6] \
		<< "\nChunk 3: " << header.chunk2[6] << "\nChunk 4: " << header.chunk3[6] << "\nChunk 5: " << header.chunk4[6] \
		<< "\nChunk 6: " << header.chunk5[6] << "\nChunk 7: " << header.chunk6[6] << "\nChunk 8: " << header.chunk7[6] \
		<< "\nChunk 9: " << header.chunk8[6] << "\nChunk 10: " << header.chunk9[6];
	
	cin.get();


    return 0;
}

