
// Cave Code Tool / esc0rtd3w 2016

// Original Source: http://www.rohitab.com/discuss/topic/39357-code-cave-injection-tutorial-c/


#include "stdafx.h"
#include <string>
#include <stdio.h>
#include <intrin.h>
#include <windows.h>
#include <istream>
#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <tlhelp32.h>

typedef BOOL(WINAPI *fnBeep)(DWORD, DWORD);
typedef int (WINAPI* MsgBoxParam)(HWND, LPCSTR, LPCSTR, UINT);

using namespace std;

struct PARAMETERS {
	DWORD MessageBoxInj;
	char text[50];
	char caption[25];
	int buttons;
	//		HWND handle;
};

DWORD getPid(string procName);
int privileges();
DWORD injectMsgBox(PARAMETERS * injectParams);
DWORD Useless();

//NTSTATUS NTAPI RtlAdjustPrivilege(ULONG, BOOLEAN, BOOLEAN, PBOOLEAN);  //This is the prototype of the RtlAdjustPrivilege function.
//RtlAdjustPrivilege(20, TRUE, FALSE, &bl);  /*20 is the value of SeDebugPrivilege. The last parameter must point to a valid variable. It can't be NULL, or an access violation will occur and crash the calling process.*/

/*
HWND window;
AllocConsole();
window = FindWindowA("ConsoleWindowClass", NULL);
ShowWindow(window, 0);
privileges();
DWORD pid = 0;
do {
pid = getPid("notepad.exe");
if (pid != 0) break;
} while (1);
*/

DWORD getPid(string procName) {
	HANDLE hsnap;
	PROCESSENTRY32 pt;
	hsnap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
	pt.dwSize = sizeof(PROCESSENTRY32);
	do {
		if (pt.szExeFile == procName) {
			DWORD pid = pt.th32ProcessID;
			CloseHandle(hsnap);
			return pid;
		}
	} while (Process32Next(hsnap, &pt));
	CloseHandle(hsnap);
	//cout << "Where Am I?: getPid\n\n";
	//system("PAUSE");
	return 0;
}

DWORD injectMsgBox(PARAMETERS * injectParams) {
	MsgBoxParam MsgBox = (MsgBoxParam)injectParams->MessageBoxInj;
	int injectResult = MsgBox(0, injectParams->text, injectParams->caption, injectParams->buttons);
	switch (injectResult) {
	case IDOK:
		cout << "Where Am I?: IDOK\n\n";
		system("PAUSE");
		break;
	case IDCANCEL:
		cout << "Where Am I?: IDCANCEL\n\n";
		system("PAUSE");
		break;
	}
	return 0;
}

DWORD Useless() {
	return 0;
}

//this function is needed to get some extra privileges so your code will be able to work without conflicts with the system
int privileges() {
	HANDLE Token;
	TOKEN_PRIVILEGES tp;
	if (OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &Token))
	{
		LookupPrivilegeValue(NULL, SE_DEBUG_NAME, &tp.Privileges[0].Luid);
		tp.PrivilegeCount = 1;
		tp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;
		if (AdjustTokenPrivileges(Token, 0, &tp, sizeof(tp), NULL, NULL) == 0) {
			return 1; //FAIL
		}
		else {
			return 0; //SUCCESS
		}
	}
	return 1;
}


int main()
{

	privileges();  //don't mind of the result, because maybe it fails because you already have that privilege

	//string process = "notepad.exe"; // Test EXE
	string process = "aminstantservice.exe"; // AM Instant Server EXE

	//cout << "Enter process name:\n\n";
	//cin >> process;

	DWORD pid = getPid(process);
	if (pid == 0) {

		cout << "Process \"" << process << "\" Not Found!\n\n";
		system("PAUSE");

		return 1; //error

	}

	HANDLE p;
	p = OpenProcess(PROCESS_ALL_ACCESS, false, pid);
	if (p == NULL) {

		cout << "Opening Process \"" << process << "\" Failed!\n\n";
		system("PAUSE");

		return 1; //error

	}

	char* txtInject = "Test Injection Text";
	char* txtCaption = "Injection Results";

	PARAMETERS data;	  //let's fill in a PARAMETERS struct

	data.MessageBoxInj = (DWORD)GetProcAddress(GetModuleHandleA("User32.dll"), "MessageBoxA");
	strcpy_s(data.text, txtInject);
	strcpy_s(data.caption, txtCaption);
	data.buttons = MB_OKCANCEL | MB_ICONQUESTION;


	DWORD size_injectMsgBox = (PBYTE)Useless - (PBYTE)injectMsgBox;  //this gets injectMsgBox's size


																	 //--------now we are ready to inject


	void * injectMsgBoxAddress = VirtualAllocEx(p, NULL, size_injectMsgBox, MEM_RESERVE | MEM_COMMIT, PAGE_EXECUTE_READWRITE);

	WriteProcessMemory(p, injectMsgBoxAddress, (void*)injectMsgBox, size_injectMsgBox, NULL);


	void * DataAddress = VirtualAllocEx(p, NULL, sizeof(PARAMETERS), MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);

	WriteProcessMemory(p, DataAddress, &data, sizeof(PARAMETERS), NULL);

	HANDLE thread = CreateRemoteThread(p, NULL, 0, (LPTHREAD_START_ROUTINE)injectMsgBoxAddress, DataAddress, 0, NULL);
	if (thread != 0) {

		//injection completed
		WaitForSingleObject(thread, INFINITE);   //this waits untill thread thread has finished
		VirtualFree(injectMsgBoxAddress, 0, MEM_RELEASE); //free injectMsgBox memory
		VirtualFree(DataAddress, 0, MEM_RELEASE); //free data memory
		CloseHandle(thread);
		CloseHandle(p);  //don't wait for the thread to finish, just close the handle to the process
		cout << "Injection completed!" << endl;
		system("PAUSE");
	}
	else {

		cout << "----------------------------------" << endl;
		cout << "Error!" << endl;
		cout << "----------------------------------\n" << endl;
		cout << "----------------------------------" << endl;
		cout << "process: " << process << endl;
		cout << "pid: " << pid << endl;
		cout << "thread: " << thread << endl;
		cout << "----------------------------------" << endl;
		cout << "DataAddress: " << DataAddress << endl;
		cout << "injectMsgBoxAddress: " << injectMsgBoxAddress << endl;
		cout << "size_injectMsgBox: " << size_injectMsgBox << endl;
		cout << "----------------------------------" << endl;
		cout << "data.buttons: " << data.buttons << endl;
		cout << "data.caption: " << data.caption << endl;
		cout << "data.MessageBoxInj: " << data.MessageBoxInj << endl;
		cout << "data.text: " << data.text << endl;
		cout << "----------------------------------\n" << endl;
	}


	system("PAUSE");
	return EXIT_SUCCESS;



}

#pragma intrinsic(_ReturnAddress)

__declspec(noinline)
void noinline_func(void)
{
	printf("Return address from %s: %p\n", __FUNCTION__, _ReturnAddress());
}