// AMI_Game_Monitor.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

#include <string>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <stdlib.h>
#include <filesystem>

#include "stdio.h"
#include "windows.h"

#using <System.dll>

using namespace System;
using namespace System::IO;
using namespace System::Security::Permissions;


public ref class AMI_Monitor
{
private:
	// Define the event handlers.
	static void OnChanged(Object^ /*source*/, FileSystemEventArgs^ e)
	{
		// Specify what is done when a file is changed, created, or deleted.
		//Console::WriteLine("File: {0} {1}", e->FullPath, e->ChangeType);
		Console::WriteLine("File: {0} {1}", e->FullPath, e->ChangeType);
	}

	static void OnRenamed(Object^ /*source*/, RenamedEventArgs^ e)
	{
		// Specify what is done when a file is renamed.
		//Console::WriteLine("File: {0} renamed to {1}", e->OldFullPath, e->FullPath);
		Console::WriteLine("File: {0} renamed to {1}", e->OldFullPath, e->FullPath);
	}

public:
	[PermissionSet(SecurityAction::Demand, Name = "FullTrust")]
	int static run()
	{

		Console::Title = "activeMARK Instant Server Game Monitor";

		array<String^>^args = System::Environment::GetCommandLineArgs();

		// If no args specified, do something
		if (args->Length != 2)
		{
			// Display the proper way to call the program.
			//Console::WriteLine("Usage: amigm.exe [$directory]");
			Console::WriteLine("Usage: amigm.exe [options] [$directory (optional with --directory)]");
			return 420;
		}

		// For this part, I got a little help from here: http://www.cplusplus.com/forum/articles/13355/
		if (args)
		{
			int i = 1;
			int arg = 1;
			int argv1[1];
			int argv2[1];
			int argv3[1];
			if (i + 1 != arg)
				if (args[i] == "--debug") {
					arg = argv1[i + 1];
					Console::WriteLine("--debug: ");
				}
				else if (args[i] == "--directory") {
					arg = argv2[i + 1];
					Console::WriteLine("--directory: ");
				}
				else if (args[i] == "--help") {
					arg = argv3[i + 1];
					Console::WriteLine("--help: ");
				}
				else {
					std::cout << "Not enough or invalid arguments, please try again.\n";
					Sleep(2000);
				}

			// Display the proper way to call the program.
			//Console::WriteLine("Usage: amigm.exe [$directory]");
			Console::WriteLine(args[0] + " " + args[1]);
			return 101;
		}

		// Create a new FileSystemWatcher and set its properties.
		FileSystemWatcher^ AMI_Monitor = gcnew FileSystemWatcher;
		AMI_Monitor->Path = args[1];

		/* Watch for changes in LastAccess and LastWrite times, and
		the renaming of files or directories. */
		AMI_Monitor->NotifyFilter = static_cast<NotifyFilters>(NotifyFilters::LastAccess |
			NotifyFilters::LastWrite | NotifyFilters::FileName | NotifyFilters::DirectoryName);

		// Only watch text files.
		AMI_Monitor->Filter = "*";

		// Add event handlers.
		AMI_Monitor->Changed += gcnew FileSystemEventHandler(AMI_Monitor::OnChanged);
		AMI_Monitor->Created += gcnew FileSystemEventHandler(AMI_Monitor::OnChanged);
		AMI_Monitor->Deleted += gcnew FileSystemEventHandler(AMI_Monitor::OnChanged);
		AMI_Monitor->Renamed += gcnew RenamedEventHandler(AMI_Monitor::OnRenamed);

		// Begin watching.
		AMI_Monitor->EnableRaisingEvents = true;

		// Wait for the user to quit the program.
		Console::WriteLine("\n\nactiveMARK Instant Server Game Monitor\n\nPress \'x\' and ENTER to exit\n\n\n");
		while (Console::Read() != 'x');

		return 0;
	}
};

int main() {



	AMI_Monitor::run();
}


