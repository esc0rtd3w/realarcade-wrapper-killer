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

using namespace std;


// Original Help Source: http://stackoverflow.com/questions/997946/how-to-get-current-time-and-date-in-c


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

	cout << "Inside Time Loop" << endl;

	currentTime(1);


	getchar();

}

int main() {

	char* _amiLockDate;
	char* _amiLockTime;

	int amiLockDate;
	int amiLockTime;

	int amiStartDate;
	int amiStartDateDay;
	int amiStartDateMonth;
	int amiStartDateYear;

	int amiStartTime;
	int amiStartTimeHours;
	int amiStartTimeMinutes;
	int amiStartTimeSeconds;

	TimeLoop();

	//Console::Title = "activeMARK Instant Server Time Lock";

	//cout << "AMI Time Lock                                   esc0rtd3w 2016 \n\n" << endl;
	cout << "currentDate: " << currentDate(1) << endl;
	cout << "currentDateDay: " << currentDate(2) << endl;
	cout << "currentDateMonth: " << currentDate(3) << endl;
	cout << "currentDateYear: " << currentDate(4) << endl;
	cout << "currentTime: " << currentTime(1) << endl;
	cout << "currentTimeHour: " << currentTime(2).substr(0, 2) << endl;
	cout << "currentTimeMinute: " << currentTime(3).substr(3, 5).substr(0, 2) << endl;
	cout << "currentTimeSecond: " << currentTime(4).substr(6, 8) << endl;

	getchar();  // wait for keyboard input


}

