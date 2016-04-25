// rfstools v0.1
// esc0rtd3w 2016 / https://github.com/esc0rtd3w

#include "stdafx.h"
#include <stdio.h>
#include <iostream>
#include <windows.h>
#include <tchar.h>
#include <conio.h>
#include <strsafe.h>

#include "headerRFS.h"

using namespace std;

int main()
{
	// Set Window Title
	SetConsoleTitle(TEXT("RFS Tool v0.1 Alpha                                                               " \
		"                       esc0rtd3w 2016"));

	// Print RFS Header Info
	cout << "RFS Default Header Info\n\n" << "Chunk 1: " << chunk0[5] << "\nChunk 2: " << chunk1[5] \
		<< "\nChunk 3: " << chunk2[5] << "\nChunk 4: " << chunk3[5] << "\nChunk 5: " << chunk4[5] \
		<< "\nChunk 6: " << chunk5[5] << "\nChunk 7: " << chunk6[5] << "\nChunk 8: " << chunk7[5] \
		<< "\nChunk 9: " << chunk8 << "\nChunk 10: " << chunk9;

	cin.get();


    return 0;
}

