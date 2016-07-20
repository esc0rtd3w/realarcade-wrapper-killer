// activeMARK Instant Server Time Lock


#include "stdafx.h"

#include <string>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <stdlib.h>
#include <filesystem>

#include <time.h>
#include "stdio.h"
#include "windows.h"
#include <cstdlib>
#include <cstdio>
#include <tlhelp32.h>


using namespace std;
using namespace System;
using namespace System::Diagnostics;


// Original Help Source: http://stackoverflow.com/questions/997946/how-to-get-current-time-and-date-in-c

wchar_t* gameEXE;

bool IsProcessRunning(const wchar_t *processName);

string amiLockDate;
string amiLockTime;

string amiStartDate;
string amiStartDateDay;
string amiStartDateMonth;
string amiStartDateYear;

string amiStartTime;
string amiStartTimeHours;
string amiStartTimeMinutes;
string amiStartTimeSeconds;


// Get current date/time, format is YYYY-MM-DD.HH:mm:ss
const string currentDate(int section) {
	time_t     now = time(0);
	struct tm  tstruct;
	char       buf[80];
	tstruct = *localtime(&now);

	if (section == 1)
	{
		int amiStartDate = strftime(buf, sizeof(buf), "%Y-%m-%d", &tstruct);
	}

	if (section == 2)
	{
		int amiStartDateDay = strftime(buf, sizeof(buf), "%d", &tstruct);
	}

	if (section == 3)
	{
		int amiStartDateMonth = strftime(buf, sizeof(buf), "%m", &tstruct);
	}

	if (section == 4)
	{
		int amiStartDateYear = strftime(buf, sizeof(buf), "%Y", &tstruct);
	}

	return buf;
}

const string currentTime(int section) {
	time_t     now = time(0);
	struct tm  tstruct;
	char       buf[80];
	tstruct = *localtime(&now);

	if (section == 1)
	{
		int amiStartTime = strftime(buf, sizeof(buf), "%X", &tstruct);
	}

	if (section == 2)
	{
		int amiStartTimeHours = strftime(buf, sizeof(buf), "%X", &tstruct);
	}

	if (section == 3)
	{
		int amiStartTimeMinutes = strftime(buf, sizeof(buf), "%X", &tstruct);
	}

	if (section == 4)
	{
		int amiStartTimeSeconds = strftime(buf, sizeof(buf), "%X", &tstruct);
	}

	return buf;
}


void TimeLoop() {


}

bool IsProcessRunning(const wchar_t *processName)
{
	bool exists = false;
	PROCESSENTRY32 entry;
	entry.dwSize = sizeof(PROCESSENTRY32);

	HANDLE snapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, NULL);

	if (Process32First(snapshot, &entry))
		while (Process32Next(snapshot, &entry))
			if (!wcsicmp(entry.szExeFile, processName))
				exists = true;

	CloseHandle(snapshot);
	return exists;
}

bool isRunning(LPWSTR pName)
{
	HWND hwnd;
	hwnd = FindWindow(NULL, pName);
	if (hwnd != 0) {
		return true;
	}
	else {
		return false;
	}
}

int main2(array<System::String ^> ^args)
{
	String ^notepad_path = "C:\\Windows\\System32\\notepad.exe";//<-- path to .exe
	ProcessStartInfo ^notepad_procinfo = gcnew ProcessStartInfo(notepad_path);//<-- process start info,
																			  //^^ required to associate an instance of the process class with the process it creates.
	Process ^notepad_proc = gcnew Process();//<-- Process class instance.

	notepad_proc->StartInfo = notepad_procinfo;//<-- Set this property to the notepad_procinfo.
	if (notepad_proc->Start())//<-- parameterless start method called, it uses the previously established ProcessStartInfo
							  //^^ This method is NOT static, unlike the version you were previously using.  This version is unique to the class instance.
	{
		Console::WriteLine("Notepad running.");
	}
	else
	{
		Console::WriteLine("PROCESS CREATION FAILED!");
		return 1;
	}
	while (!notepad_proc->HasExited)
	{
		Console::WriteLine("Still running...");
		Threading::Thread::Sleep(1000);
	}
	return 0;
}

int main() {

	amiStartDate = currentDate(1);
	amiStartDateDay = currentDate(2);
	amiStartDateMonth = currentDate(3);
	amiStartDateYear = currentDate(4);

	amiStartTime = currentTime(1);
	amiStartTimeHours = currentTime(2).substr(0, 2);
	amiStartTimeMinutes = currentTime(3).substr(3, 5).substr(0, 2);
	amiStartTimeSeconds = currentTime(4).substr(6, 8);


	TimeLoop();

	//Console::Title = "activeMARK Instant Server Time Lock";

	//cout << "AMI Time Lock                                   esc0rtd3w 2016 \n\n" << endl;
	cout << "currentDate: " << amiStartDate << endl;
	cout << "currentDateDay: " << amiStartDateDay << endl;
	cout << "currentDateMonth: " << amiStartDateMonth << endl;
	cout << "currentDateYear: " << amiStartDateYear << endl;
	cout <<  endl;
	cout << "currentTime: " << amiStartTime << endl;
	cout << "currentTimeHour: " << amiStartTimeHours << endl;
	cout << "currentTimeMinute: " << amiStartTimeMinutes << endl;
	cout << "currentTimeSecond: " << amiStartTimeSeconds << endl;

	getchar();  // wait for keyboard input


}

