#pragma once

namespace URABrowser {

	using namespace System;
	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;

	/// <summary>
	/// Summary for BrowserMain
	/// </summary>
	public ref class BrowserMain : public System::Windows::Forms::Form
	{
	public:
		BrowserMain(void)
		{
			InitializeComponent();
			//
			//TODO: Add the constructor code here
			//
		}

	protected:
		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		~BrowserMain()
		{
			if (components)
			{
				delete components;
			}
		}
	private: System::Windows::Forms::MenuStrip^  menuStrip1;
	private: System::Windows::Forms::ToolStripMenuItem^  mnuFile;
	private: System::Windows::Forms::ToolStripMenuItem^  mnuFileExit;
	private: System::Windows::Forms::ToolStripMenuItem^  mnuHelp;
	private: System::Windows::Forms::ToolStripMenuItem^  mnuHelpAbout;
	private: System::Windows::Forms::ToolStripMenuItem^  mnuUserAgent;
	private: System::Windows::Forms::ToolStripMenuItem^  mnuUserAgentAmHttpClient;
	private: System::Windows::Forms::ToolStripMenuItem^  mnuUserAgentAmHttpGet;

	protected:


	private:
		/// <summary>
		/// Required designer variable.
		/// </summary>
		System::ComponentModel::Container ^components;

#pragma region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		void InitializeComponent(void)
		{
			this->menuStrip1 = (gcnew System::Windows::Forms::MenuStrip());
			this->mnuFile = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->mnuFileExit = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->mnuHelp = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->mnuHelpAbout = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->mnuUserAgent = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->mnuUserAgentAmHttpClient = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->mnuUserAgentAmHttpGet = (gcnew System::Windows::Forms::ToolStripMenuItem());
			this->menuStrip1->SuspendLayout();
			this->SuspendLayout();
			// 
			// menuStrip1
			// 
			this->menuStrip1->Items->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(3) {
				this->mnuFile, this->mnuUserAgent,
					this->mnuHelp
			});
			this->menuStrip1->Location = System::Drawing::Point(0, 0);
			this->menuStrip1->Name = L"menuStrip1";
			this->menuStrip1->Size = System::Drawing::Size(896, 24);
			this->menuStrip1->TabIndex = 0;
			this->menuStrip1->Text = L"menuStrip1";
			// 
			// mnuFile
			// 
			this->mnuFile->DropDownItems->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(1) { this->mnuFileExit });
			this->mnuFile->Name = L"mnuFile";
			this->mnuFile->Size = System::Drawing::Size(37, 20);
			this->mnuFile->Text = L"File";
			// 
			// mnuFileExit
			// 
			this->mnuFileExit->Name = L"mnuFileExit";
			this->mnuFileExit->Size = System::Drawing::Size(152, 22);
			this->mnuFileExit->Text = L"Exit";
			// 
			// mnuHelp
			// 
			this->mnuHelp->DropDownItems->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(1) { this->mnuHelpAbout });
			this->mnuHelp->Name = L"mnuHelp";
			this->mnuHelp->Size = System::Drawing::Size(44, 20);
			this->mnuHelp->Text = L"Help";
			// 
			// mnuHelpAbout
			// 
			this->mnuHelpAbout->Name = L"mnuHelpAbout";
			this->mnuHelpAbout->Size = System::Drawing::Size(152, 22);
			this->mnuHelpAbout->Text = L"About";
			// 
			// mnuUserAgent
			// 
			this->mnuUserAgent->DropDownItems->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(2) {
				this->mnuUserAgentAmHttpClient,
					this->mnuUserAgentAmHttpGet
			});
			this->mnuUserAgent->Name = L"mnuUserAgent";
			this->mnuUserAgent->Size = System::Drawing::Size(77, 20);
			this->mnuUserAgent->Text = L"User Agent";
			// 
			// mnuUserAgentAmHttpClient
			// 
			this->mnuUserAgentAmHttpClient->Name = L"mnuUserAgentAmHttpClient";
			this->mnuUserAgentAmHttpClient->Size = System::Drawing::Size(172, 22);
			this->mnuUserAgentAmHttpClient->Text = L"AmHttpClient v1.0";
			// 
			// mnuUserAgentAmHttpGet
			// 
			this->mnuUserAgentAmHttpGet->Name = L"mnuUserAgentAmHttpGet";
			this->mnuUserAgentAmHttpGet->Size = System::Drawing::Size(172, 22);
			this->mnuUserAgentAmHttpGet->Text = L"AmHttpGet 1.0";
			// 
			// BrowserMain
			// 
			this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
			this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
			this->ClientSize = System::Drawing::Size(896, 371);
			this->Controls->Add(this->menuStrip1);
			this->MainMenuStrip = this->menuStrip1;
			this->Name = L"BrowserMain";
			this->Text = L"unRealArcade Web Browser";
			this->Load += gcnew System::EventHandler(this, &BrowserMain::BrowserMain_Load);
			this->menuStrip1->ResumeLayout(false);
			this->menuStrip1->PerformLayout();
			this->ResumeLayout(false);
			this->PerformLayout();

		}
#pragma endregion

	// Set some defaults
	private: System::Void BrowserMain_Load(System::Object^  sender, System::EventArgs^  e) {

		

	}
};
}
