#ifndef __RFS__
#define __RFS__

#include <stdio.h>
#include <iostream>

#pragma once


// Header Info
// All numerical values are in hexidecimal

// ID, Label, Start Byte, End Byte, Number of Bytes, Raw Hex

class Header {

	char* chunk0[6];
	char* chunk1[6];
	char* chunk2[6];
	char* chunk3[6];
	char* chunk4[6];
	char* chunk5[6];
	char* chunk6[6];
	char* chunk7[6];
	char* chunk8[6];
	char* chunk9[6];

};



#endif 
