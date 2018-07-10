#pragma once

namespace AMI_Game_Launcher {

	using namespace System;
	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;

	/// <summary>
	/// Summary for amiMain
	/// </summary>
	public ref class amiMain : public System::Windows::Forms::Form
	{
	public:
		amiMain(void)
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
		~amiMain()
		{
			if (components)
			{
				delete components;
			}
		}
	private: System::Windows::Forms::TextBox^  txtContentID;
	private: System::Windows::Forms::Label^  lblContentID;
	private: System::Windows::Forms::GroupBox^  grpGameInfo;
	private: System::Windows::Forms::GroupBox^  grpTrialInfo;
	private: System::Windows::Forms::Button^  btnLaunchGame;
	private: System::Windows::Forms::TreeView^  treeView1;
	private: System::Windows::Forms::StatusStrip^  statusStrip;


	protected:

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
			System::Windows::Forms::TreeNode^  treeNode3 = (gcnew System::Windows::Forms::TreeNode(L"Node0"));
			this->txtContentID = (gcnew System::Windows::Forms::TextBox());
			this->lblContentID = (gcnew System::Windows::Forms::Label());
			this->grpGameInfo = (gcnew System::Windows::Forms::GroupBox());
			this->grpTrialInfo = (gcnew System::Windows::Forms::GroupBox());
			this->btnLaunchGame = (gcnew System::Windows::Forms::Button());
			this->treeView1 = (gcnew System::Windows::Forms::TreeView());
			this->statusStrip = (gcnew System::Windows::Forms::StatusStrip());
			this->SuspendLayout();
			// 
			// txtContentID
			// 
			this->txtContentID->Location = System::Drawing::Point(79, 58);
			this->txtContentID->MaxLength = 32;
			this->txtContentID->Name = L"txtContentID";
			this->txtContentID->Size = System::Drawing::Size(215, 20);
			this->txtContentID->TabIndex = 0;
			this->txtContentID->WordWrap = false;
			this->txtContentID->TextChanged += gcnew System::EventHandler(this, &amiMain::textBox1_TextChanged);
			// 
			// lblContentID
			// 
			this->lblContentID->AutoSize = true;
			this->lblContentID->Location = System::Drawing::Point(12, 61);
			this->lblContentID->Name = L"lblContentID";
			this->lblContentID->Size = System::Drawing::Size(61, 13);
			this->lblContentID->TabIndex = 1;
			this->lblContentID->Text = L"Content ID:";
			// 
			// grpGameInfo
			// 
			this->grpGameInfo->Location = System::Drawing::Point(12, 113);
			this->grpGameInfo->Name = L"grpGameInfo";
			this->grpGameInfo->Size = System::Drawing::Size(316, 174);
			this->grpGameInfo->TabIndex = 2;
			this->grpGameInfo->TabStop = false;
			this->grpGameInfo->Text = L"Game Info";
			// 
			// grpTrialInfo
			// 
			this->grpTrialInfo->Location = System::Drawing::Point(12, 293);
			this->grpTrialInfo->Name = L"grpTrialInfo";
			this->grpTrialInfo->Size = System::Drawing::Size(316, 188);
			this->grpTrialInfo->TabIndex = 3;
			this->grpTrialInfo->TabStop = false;
			this->grpTrialInfo->Text = L"Trial/Demo Info";
			// 
			// btnLaunchGame
			// 
			this->btnLaunchGame->Location = System::Drawing::Point(300, 56);
			this->btnLaunchGame->Name = L"btnLaunchGame";
			this->btnLaunchGame->Size = System::Drawing::Size(90, 23);
			this->btnLaunchGame->TabIndex = 4;
			this->btnLaunchGame->Text = L"Launch Game";
			this->btnLaunchGame->UseVisualStyleBackColor = true;
			// 
			// treeView1
			// 
			this->treeView1->Location = System::Drawing::Point(364, 121);
			this->treeView1->Name = L"treeView1";
			treeNode3->Name = L"Node0";
			treeNode3->Text = L"Node0";
			this->treeView1->Nodes->AddRange(gcnew cli::array< System::Windows::Forms::TreeNode^  >(1) { treeNode3 });
			this->treeView1->Size = System::Drawing::Size(262, 360);
			this->treeView1->TabIndex = 5;
			// 
			// statusStrip
			// 
			this->statusStrip->Location = System::Drawing::Point(0, 488);
			this->statusStrip->Name = L"statusStrip";
			this->statusStrip->Size = System::Drawing::Size(848, 22);
			this->statusStrip->SizingGrip = false;
			this->statusStrip->TabIndex = 6;
			this->statusStrip->Text = L"Ready";
			// 
			// amiMain
			// 
			this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
			this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
			this->ClientSize = System::Drawing::Size(848, 510);
			this->Controls->Add(this->statusStrip);
			this->Controls->Add(this->treeView1);
			this->Controls->Add(this->grpTrialInfo);
			this->Controls->Add(this->btnLaunchGame);
			this->Controls->Add(this->grpGameInfo);
			this->Controls->Add(this->lblContentID);
			this->Controls->Add(this->txtContentID);
			this->MaximizeBox = false;
			this->Name = L"amiMain";
			this->SizeGripStyle = System::Windows::Forms::SizeGripStyle::Hide;
			this->Text = L"AMI Game Launcher                                                                "
				L" cRypTiCwaRe 2o18  ";
			this->TopMost = true;
			this->ResumeLayout(false);
			this->PerformLayout();

		}
#pragma endregion
	private: System::Void textBox1_TextChanged(System::Object^  sender, System::EventArgs^  e) {
	}
	};
}
