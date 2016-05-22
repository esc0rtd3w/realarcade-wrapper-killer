#include "BrowserMain.h"

using namespace System;
using namespace System::Windows::Forms;


[STAThread]
void Main(array<String^>^ args)
{
	Application::EnableVisualStyles();
	Application::SetCompatibleTextRenderingDefault(false);

	URABrowser::BrowserMain form;
	Application::Run(%form);


	


}

/*
int main(int argc, char **argv)
{

}
*/