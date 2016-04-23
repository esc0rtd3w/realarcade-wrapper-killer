// ==UserScript==
// @name        Gamehouse Package Tool
// @namespace   com.crypticware.ghpkgtool
// @description Parses Content ID from page to create a direct download links to all the package types
// @include     http://www.gamehouse.com/download-games/*
// @include     http://www.gamehouse.com/new-games*
// @include     http://www.gamehouse.com/top-100-games*
// @include     http://www.gamehouse.com/platinum-games*
// @include     http://www.gamehouse.com/free-games*
// @version     0.3.1
// @grant       none
// ==/UserScript==



// Part of the RealArcade Wrapper Killer
// cRypTiCwaRe 2016



// This is a side project of mine.
// I am in no way a Javascript programmer, but more of a curious hacker ;)

// I have been involved with hacking, reverse-engineering, and collecting data from RealArcade, and now GameHouse since 2005.

// My code is probably shit, so do not laugh!!!





// START SAMPLE URLS -------------------------------------------------------------------/

// EXE Stub
// http://installer-manager.gamehouse.com/InstallerManager/getinstaller?filename=f86bc49a788ace0058a420899e086139-supergloveshero.rfs&offering=supergloveshero&channel=z_syn_gh_g12

// EXE Stub (RGA With Lang)
// http://installer-manager.gamehouse.com/InstallerManager/getinstaller?filename=reaxxion_EN.rga&offering=dip_nt_zy_en&channel=z_syn_gh_g12

// EXE Stub (RGA No Lang)
// http://installer-manager.gamehouse.com/InstallerManager/getinstaller?filename=MONOPOLY.rga&offering=dip_nt_zy_en&channel=z_syn_gh_g12


// RFS
// http://games-dl.gamehouse.com/zylom/ghmigration/supergloveshero/f86bc49a788ace0058a420899e086139-supergloveshero.rfs

// RFS Platinum Edition

// Normal filename using "platinumedition" as the string
// http://games-dl.gamehouse.com/zylom/ghmigration/fantasyquest2platinumedition/bb71c9cc936841399273205d059e405f-fantasyquest2platinumedition.rfs

// Replace "platinumedition" with "pe"
// http://games-dl.gamehouse.com/zylom/ghmigration/sablemazesullivanriverpe/5b8ef99d94b4cc0d4be3b7805188522f-sablemazesullivanriverpe.rfs

// Replace Each word after 32 chars with just the first letter??
// http://games-dl.gamehouse.com/zylom/ghmigration/deathuponanaustriansonataadknpe/af5adab1ea584472a88c2f32b111ec45-deathuponanaustriansonataadknpe.rfs


// RGA (No Lang)
// http://games-dl.gamehouse.com/zylom/popcap/dip_nt_zy_en/MONOPOLY.rga

// RGA (With Lang)
// http://games-dl.gamehouse.com/zylom/mumbo/dip_nt_zy_en/supergloveshero_EN.rga
// http://games-dl.gamehouse.com/zylom/popcap/dip_nt_zy_en/AstroPopDeluxe_EN.rga

// Stub Installer
// http://amlocalhost.trymedia.com/offline/00edd86c60350000/_build.js?_=1459237405310

// END SAMPLE URLS --------------------------------------------------------------------/



// START DEFAULTS ---------------------------------------------------------------------/

// Basic Info and Text
//var scriptVer = "0.3.1";
//var scriptTitle = "GH Package Download Tool " + "v" + scriptVer + "\n\n\n";
//var scriptCredits = "\n\n\nesc0rtd3w / cRypTiCwaRe 2016";


// Set URL Values For Different Game Types
// Example URL: $server/$distributor/$developer/$offering

// Mobile: http://m.gamehouse.com/games/collapse!-blast
// Mobile Play: http://cdn.ghstatic.com/mobile-archives/collapse-blast/index.html

// Server Base URLs
var server = [];
server.push("http://games-dl.gamehouse.com");// Default GameHouse Download Server
server.push("http://origin.gamehouse.com");// Alternate GameHouse and RealArcade Server (Check /gameconsole/)
server.push("http://installer-manager.gamehouse.com");// Default GameHouse Stub Building Server
server.push("http://www.gamehouse.com");// Main GameHouse Website Server
server.push("http://games-dl2.real.com");// Legacy RealArcade Download Server
server.push("http://install.real.com");// Legacy RealArcade Package Generator Server
server.push("http://switchboard.real.com");// Alternate Legacy RealArcade Package Generator Server
server.push("http://downloads.gamehouse.com");// Default Mac Download Server
server.push("http://m.gamehouse.com");// Default Mobile Download Server
server.push("http://cdn.ghstatic.com");// Default Content Server

// Game Paths On Server
var path = [];
path.push("/");// Default Path
path.push("/gameconsole/games/demorgses/");// Legacy RealArcade Demo RGS Game Path
path.push("/gameconsole/realarcadev21/games/");// Legacy GameHouse and RealArcade RGA Path
path.push("/gameconsole/realarcadev21/games/dip/");// Legacy Updated GameHouse and RealArcade RGA Path
path.push("/gameconsole/realarcadev21/games/am-");// Legacy Activemark (Trial Game) GameHouse and RealArcade RGA Path
path.push("/gameconsole/realarcadev21/games/amg-");// Legacy Activemark (Free Game) GameHouse and RealArcade RGA Path
path.push("/pub/");// Default Mac OSX DMG Path (amac-)
path.push("/InstallerManager/getinstaller?filename=");// Default EXE Stub Path (2015/2016)

// Distributor List
var distributor = [];
distributor.push("zylom");// Default Distributor After Migration

// Developer List
var developer = [];
developer.push("ghmigration");// Default Zylom Migration
developer.push("artifex");
developer.push("dekovir");
developer.push("mumbo");
developer.push("popcap");
developer.push("terminalstudio");

// Offering List
var offering = [];
offering.push("dip_nt_zy_en");// Default Offering (RGA Links Only??)

// Channel List
var channel = [];
channel.push("z_syn_gh_g12");// Default Zylom/GameHouse Channel

// Language List
var language = [];
language.push("");// Default Blank
language.push("_EN");// Default RGA English (Newer 2015/2016 Style)
language.push("_DE");// Dutch
language.push("_FR");// French

// File Extension List
var ext = [];
ext.push("exe");// Legacy EXE Game Installer and Stubs
ext.push("rga");// Original GameHouse WinRAR Compressed Installer
ext.push("rfs");// New RFS File Format (2015/2016)
ext.push("dmg");// Mac OSX DMG Game Install Images
ext.push("rgs");// Legacy RealArcade RGS Game Installer (XZIP 2.0)
ext.push("rgi");// Legacy RealArcade RGS XML Game Info
ext.push("rgp");// Legacy RealArcade RGS XML Structured Install Info
ext.push("mez");// Legacy RealArcade RGS XZip 2.0 Header Stub??

// Bases URL (EXE Stub)
var baseExeStub = server[2] + "/InstallerManager/getinstaller?filename=";

// Acid Config Info
var baseAcidConfig = server[2] + "/InstallerManager/getinstallersettings?installationid=";// First part before Install ID
var postAcidConfig = "&component=acid&version=1.20";// 2nd part after Install ID

// Placeholder For Getting Root Path
var rootDirectory = "";

// Set Default Game Info Values
var base = server[0] + "/" + distributor[0] + "/" + developer[0] + "/";
var gameNameTitle = "Game Name Title Here";
var gameNameWebpage = "game-name-here";
var gameNamePackage = "gamenamehere";
var cid = "00000000000000000000000000000000";// Content ID
var iid = "00000000000000000000000000000000";// Installation ID

var gameTitle = "";
var gameInfo = "";

var advancedOptions = 0;

// Set Default Link Variables
var linkHijack = "";
var linkAcid = "";
var linkAdvanced = "";
var linkEXE = "";
var linkRGALang = "";
var linkRGANoLang = "";
var linkRGALegacy = "";
var linkRGATrial = "";
var linkRGAUnlimited = "";
var linkRGSFree = "";
var linkRGSFull = "";
var linkRFS = "";
var linkDMGLegacy = "";
var linkDMGNew = "";
var linkOriginVuln = "http://origin.gamehouse.com/gameconsole/";

// Default Hijack Elements
var hijackID;
var hijackMe;
var hijackDescription;
var hijackBuy;
var hijackNewGamesHeader;
var hijackNewGamesDesc;

// Default Button Elements
var btnPlayNow = "dl_now_button button";
var btnFreePlay = "dl_now_button";
var btnFunpass = "funpass_btn";
var btnDiscontinued = "discontinued";

// Default Hijacked/Cloned Button Elements
var btnHijack = "dl_now_button_hijack";
var btnHijackAcid = "dl_now_button_acid";
var btnHijackAdvanced = "dl_now_button_advanced";
var btnHijackEXE = "dl_now_button_exe";
var btnHijackRFS = "dl_now_button_rfs";
var btnHijackRGALang = "dl_now_button_rga_lang";
var btnHijackRGANoLang = "dl_now_button_rga_no_lang";
var btnHijackRGALegacy = "dl_now_button_rga_legacy";
var btnHijackRGATrial = "dl_now_button_rga_trial";
var btnHijackRGAUnlimited = "dl_now_button_rga_unlimited";
var btnHijackRGSFree = "dl_now_button_rgs_free";
var btnHijackRGSFull = "dl_now_button_rgs_full";
var btnHijackDMGLegacy = "dl_now_button_dmg_legacy";
var btnHijackDMGNew = "dl_now_button_dmg_new";
//var btnHijackOriginVuln = "dl_now_button_origin_vulnerability";

// Link Statuses
var linkCheckRequest;
var linkStatusAcid;
var linkStatusAdvanced;
var linkStatusEXE;
var linkStatusRFS;
var linkStatusRGALang;
var linkStatusRGANoLang;
var linkStatusRGALegacy;
var linkStatusRGATrial;
var linkStatusRGAUnlimited;
var linkStatusRGSFree;
var linkStatusRGSFull;
var linkStatusDMGLegacy;
var linkStatusDMGNew;

// Special Situations (Platinum, Double Pack, Deluxe, Funpass, etc)
var isDeluxe = 0;
var isDoublePack = 0;
var isFreeplay = 0;
var isFunpass = 0;
var isPlatinum = 0;

// Special Filename Situations
var isCopyright = 0;
var isTrademark = 0;
var isRegTrademark = 0;

// Special Webpage Situations
var isDiscontinued = 0;
var isMembersOnly = 0;
var isLoggedIn = 0;
var isFavHeart = 0;

// END DEFAULTS -----------------------------------------------------------------------/



// BEGIN FUNCTIONS --------------------------------------------------------------------/

// Get Root Path
function getRootPath(){
	rootDirectory = window.location.href.substring(25);// Remove http://www.gamehouse.com/
	rootDirectory.split('/');
	rootDirectory = rootDirectory.split('?')[0];
	//alert(rootDirectory);
}

// Force Page To Display All Available Games
// This function can cause long page load times depending on the number of items loaded
function showAllGames(){
	var totalGames = document.getElementById("countsOnGameList");
	//totalGames.split(" ");
	var numberOfGamesToShow = 25;
	var startingPoint = 0;
	var linkAllGames = "http://www.gamehouse.com/new-games?platform=pc-games#gametype=download&genre=all&sorting=name&count=" + numberOfGamesToShow.toString + "&filterType=new-games&listView=true&start=" + startingPoint.toString;
	window.location = linkAllGames;
}

// Scroll To Bottom of Page
function scrollToBottom(height){
	window.scrollTo(0,document.body.scrollHeight);
}


// Get Content ID
function getCID(){
	// Get 32 Chars Directly Between the Equal Sign "=" and The Next Ampersand "&" From Page Source
	// Example: gamesetid=6000&contentid=6a95810f4bde20ec4b280aa125cbd491&licensetype=2
	var cidTemp = document.documentElement.innerHTML.split('contentid=');
	for(x=0; x<cidTemp.length; x++){
		if(/\d+&/i.test(cidTemp[x])){
			cid = cidTemp[x].split('&')[0];
		}
	}
}

// Get Game Name
function getGameName(){
	// Get Game Name From Title (Same as Install Directory Name)
	gameNameTitleTemp = document.getElementsByTagName("title")[0].innerHTML;

	// Trim " | Gamehouse" From End of Title
	gameNameTitle = gameNameTitleTemp.slice(0, -12);

	// Get Game Web Page Link String (With Dashes)
	gameNameWebpage = window.location.href.substring(40);

	// Get Game Direct Package Link String (Without Dashes)
	gameNamePackage = gameNameWebpage.split('-').join('');
	
	// Remove Special Characters For Link Building
	gameNamePackage = gameNamePackage.replace("#", "");
	gameNamePackage = gameNamePackage.replace("!", "");
	gameNamePackage = gameNamePackage.replace("&", "");
}

// Get Installation ID From Stub
function getInstallationID(stub) {
	// Source: http://stackoverflow.com/questions/23144647/file-api-hex-conversion-javascript
	var x = new Blob([stub]);

	var fr = new FileReader();
	fr.addEventListener('load', function () {
		var u = new Uint8Array(this.result),
			a = new Array(u.length),
			i = u.length;
		while (i--) // map to hex
			a[i] = (u[i] < 16 ? '0' : '') + u[i].toString(16);
		u = null; // free memory
		console.log(a); // work with this
	});
	fr.readAsArrayBuffer(x);
}
	

// Check For Platinum Edition
// Main Webpage Link: http://www.gamehouse.com/platinum-games?platform=pc-games
function checkPlatinum(){
	
	// Game Links Tested OK (platinumedition)
	// 9-the-dark-side-of-notre-dame-platinum-edition >> 9thedarksideofnotredameplatinumedition
	// gardens-inc-4-blooming-stars-platinum-edition >> gardensinc4bloomingstarsplatinumedition
	// lost-lands-the-golden-curse-platinum-edition >> lostlandsthegoldencurseplatinumedition
	// mystery-trackers-four-aces-platinum-edition >> mysterytrackersfouracesplatinumedition
	
	// Game Links Tested OK (pe)
	// gardens-inc-4-blooming-stars-platinum-edition >> gardensinc4bloomingstarsplatinumedition
	
	// Game Links Tested OK (1st Letter Only)
	// 12-labours-of-hercules-iv-mother-nature-platinum-edition >> 12laboursofherculesivmnpe
	
	if (gameNameTitle.search("platinumedition") != "platinumedition") {
	   isPlatinum = 1;
	} 
	
	// Check Names if "Platinum Edition"
	if (isPlatinum == 1){
		//alert("Platinum Edition");
		var origPlatinum = 'platinumedition';
		var fixPlatinum = 'pe';
		
		// Individual Game Name Fixes
		if (gameNamePackage == "12laboursofherculesivmothernatureplatinumedition") {
			gameNamePackage = "12laboursofherculesivmnpe";
		}
		// 4 Elements II Platinum Edition
		// http://games-dl.gamehouse.com/zylom/terminalstudio/dip_nt_zy_en/96c09cc5e16857e20f3e52a109f682fa-dip_nt_zy_en_v3.rfs
		if (gameNamePackage == "4elementsiiplatinumedition") {
			gameNamePackage = gameNamePackage;
		}
		// 7 Wonders - Ancient Alien Makeover Platinum Edition
		// http://games-dl.gamehouse.com/zylom/ghmigration/7wondersancientalienmakeoverpremiumedition/7wondersancientalienmakeoverpremiumedition.rga
		if (gameNamePackage == "7wondersancientalienmakeoverplatinumedition") {
			gameNamePackage = gameNamePackage;
		}
		// Abyss - The Wraiths of Eden Platinum Edition
		// http://games-dl.gamehouse.com/zylom/artifex/dip_nt_zy_en/176b2706d84b64adce6ebfbff2145eb8-dip_nt_zy_en_v2.rfs
		if (gameNamePackage == "abyssthewraithsofedenplatinumedition") {
			gameNamePackage = gameNamePackage;
		}
		
		else {
			//gameNamePackage = gameNamePackage.split('platinumedition').join(fixPlatinum);
			gameNamePackage = gameNamePackage.replace(origPlatinum, fixPlatinum);
		}
	}
}

// Check For "Double Pack"
function checkDoublePack(){
	
	// Game Links Tested OK (No "doublepack" ending and 3 of the words are shortened)
	// 4-elements-ii-call-of-atlantis-treasures-of-poseidon-double-pack >> 4elementsiicoatreasuresposeidon
	
	if (gameNameTitle.search("doublepack") != "doublepack") {
	   isDoublePack = 1;
	} 
	
	// Check Names if "Double Pack"
	if (isDoublePack == 1){
		//alert("Double Pack");
		var fixDoublePack = "";
		
		// Individual Game Name Fixes
		if (gameNamePackage == "4elementsiicallofatlantistreasuresofposeidondoublepack") {
			gameNamePackage = "4elementsiicoatreasuresposeidon";
		}
		else {
			gameNamePackage = gameNamePackage.split("doublepack").join(fixDoublePack);
		}
	}
}

// Check For "Deluxe Edition"
function checkDeluxe(){
	
	// Game Links Tested OK ("deluxe" added to end of name)
	// astro-pop >> astropop >> AstroPopDeluxe_EN.rga
	
	// Change this to an array and a list of matching games (20160324)
	/*
	if (gameNameTitle.search("") != "") {
	   isDeluxe = 1;
	} 
	*/
	
	// Check Names if "Deluxe"
	if (isDeluxe == 1){
		//alert("Deluxe Edition");
		var fixDeluxe = "";
		
		// Individual Game Name Fixes
		if (gameNamePackage == "astropop") {
			gameNamePackage = "astropopdeluxe_en";
		}
		else {
			gameNamePackage = gameNamePackage.split("").join(fixDoublePack);
		}
	}
}

// Check Trademark In Name
function checkTrademark(){
	
	// Game Links Tested OK (Added "tm" to end of filename)
	// plants-vs-zombies >> plantsvszombiestm
	
	if (gameNamePackage == "plantsvszombies") {
	   isTrademark = 1;
	}
	
	// Check Names if "Trademark"
	if (isTrademark == 1){
		//alert("Trademark");
		var fixTrademark = "tm";
		var fixRegTrademark = "r";
		gameNamePackage = gameNamePackage += fixTrademark;
	}
}

// Check Copyright In Name
function checkCopyright(){
	
	// Game Links Tested OK (Added "tm" to end of filename)
	// plants-vs-zombies >> plantsvszombiestm
	
	/*
	if (gameNamePackage == gameNamePackage += "") {
	   isCopyright = 1;
	} 
	*/
	
	// Check Names if "Copyright"
	if (isCopyright == 1){
		//alert("Copyright");
		var fixCopyright = "c";
		gameNamePackage = gameNamePackage += fixCopyright;
	}
}

// Check Freeplay Version
// Example: http://games-dl.gamehouse.com/zylom/ghmigration/amg-texttwist2/amg-texttwist2.rga
// Src: onclick="window.location.href='/pc/postdownload/texttwist-2';return false;"
function checkFreeplay(){
	
	// Game Links Tested OK (Added "amg-" to beginning of filename)
	// text-twist-2 >> texttwist2
	
	if (gameNamePackage == "texttwist2") {
	   isFreeplay = 1;
	} 
	
	// Check Names if "Freeplay"
	if (isFreeplay == 1){
		//alert("Freeplay");
		var fixFreeplay = "amg-";
		gameNamePackage = fixFreeplay += gameNamePackage;
	}
}

// Check For Discontinued Game
function checkDiscontinued(){
	
	// Sample Discontinued Game
	// 1000-light-years-away >> 1000lightyearsaway >> 476fb6e4ba5621765356419ea0f170a7
	/*
	<div class="discontinued">This game is no longer available on our website. 
	<a href="/pc-games" class="link">
	<strong><u>Click here</u></strong></a> to choose and enjoy another game. FunPass and FunTicket members can still play this game. 
	<a href="http://www.gamehouse.com/funpass" target="_blank"><strong><u>Subscribe to FunPass</u></strong></a> or 
	<a href="https://www.gamehouse.com/my-profile" target="_blank"><strong><u>log in if you have FunPass or FunTicket! </u></strong></a></div>
	*/
}

// Check For "Members Only" Games
function checkMembersOnly() {
	
	// Members Only Sticker and Link Sample Source
	// <div class="memberOnlyContainer">
	// <div class="member_only_sticker">
	// <img src="//cdn.ghstatic.com/gamehouse/images/members_only.png?20160229.131.2"></div>
	// <div class="member_only_info">This is a member-only game. <a href="/memberships/funpass/freetrial" style="color:#fff;">Subscribe to FunPass</a> to become a member and get to enjoy all our games.</div>
	// <div style="display: none;" class="member_only_tooltip">This title will be released for everyone in two weeks or less! Sign up for FunPass to play it today! <a href="/memberships/funpass/freetrial">Click here</a> to learn more.</div></div>
	
}

// Build New Download Links
function buildNewLinks(){
	
	checkPlatinum();
	checkDoublePack();
	checkTrademark();
	checkCopyright();
	checkFreeplay();
	checkDiscontinued();
	
	// Post Download Page
	// http://www.gamehouse.com/pc/postdownload/
	
	createLinksAdvanced();
	createLinksEXE();
	createLinksRFS();
	createLinksRGA();
	createLinksRGS();
	createLinksDMG();
	createLinksAcid();
}

// Create Acid Links
// These are the links that are used during the stub install process for config info
// The Installation ID can be extracted from any stub at hex offset 0x949CE - 0x949DD (16 Bytes)
// Stub version tested 1.20.128.0
function createLinksAcid() {
	linkAcid = baseAcidConfig + iid + postAcidConfig;
	//checkLink(linkAcid);
}

// Create the text and dropdown boxes for advanced options
function createLinksAdvanced() {
	linkAdvanced = server[2] + path[7] + cid + "-" + gameNamePackage + "." + ext[2] + "&offering=" + gameNamePackage + "&channel=" + channel[0];
	//checkLink(linkAdvanced);
}

function createLinksEXE() {
	// Samples
	// http://installer-manager.gamehouse.com/InstallerManager/getinstaller?filename=8f8b2b96810e622485197a556b59695b-questforthefountain.rfs&offering=questforthefountain&channel=z_syn_gh_g12
	// http://installer-manager.gamehouse.com/InstallerManager/getinstaller?filename=8a1c173c8e00ac970f70a78261a15469-incredibledraculachasinglovepe.rfs&offering=incredibledraculachasinglovepe&channel=z_syn_gh_g12
	// http://installer-manager.gamehouse.com/InstallerManager/getinstaller?filename=78bc525aad6016925de40f4d2804c036-solitairebeachseason.rfs&offering=solitairebeachseason&channel=z_syn_gh_g12
	linkEXE = server[2] + path[7] + cid + "-" + gameNamePackage + "." + ext[2] + "&offering=" + gameNamePackage + "&channel=" + channel[0];
	//checkLink(linkEXE);
}

function createLinksRFS() {
	// Samples
	// igtslotsendoftherainbowcollection >> igtslotsendoftherainbowcollect
	linkRFS = server[0] + "/" + distributor[0] + "/" + developer[0] + "/" + gameNamePackage + "/" + cid + "-" + gameNamePackage + "." + ext[2];
	//checkLink(linkRFS);
}

function createLinksRGA() {
	// Samples
	// games-dl2.stage.real.com\integration\realarcade\games\dip
	// http://games-dl.gamehouse.com/zylom/dekovir/dip_nt_zy_en/TradeMania2_EN.rga
	linkRGALang = server[0] + "/" + distributor[0] + "/" + developer[3] + "/" + gameNamePackage + language[1] + "." + ext[1];
	//checkLink(linkRGALang);
	linkRGALangOffering = server[0] + "/" + distributor[0] + "/" + developer[2] + "/" + offering[0] + "/" + gameNamePackage + language[1] + "." + ext[1];
	//checkLink(linkRGALangOffering);
	//linkRGANoLang = server[0] + "/" + distributor[0] + "/" + developer[3] + "/" + gameNamePackage + "." + ext[1];
	linkRGANoLang = server[0] + "/" + distributor[0] + "/" + developer[0] + "/" + gameNamePackage + "/" + gameNamePackage + "." + ext[1];
	//checkLink(linkRGANoLang);
	linkRGALegacy = server[1] + path[4] + gameNamePackage + "/" + "am-" + gameNamePackage + "." + ext[1];
	//checkLink(linkRGALegacy);
	linkRGATrial = server[1] + path[3] + gameNamePackage + "/" + gameNamePackage + "." + ext[1];
	//checkLink(linkRGATrial);
	linkRGAUnlimited = server[1] + path[5] + gameNamePackage + "/" + "amg-" + gameNamePackage + "." + ext[1];
	//checkLink(linkRGAUnlimited);
}

function createLinksRGS() {
	linkRGSFree = server[1] + path[1] + gameNamePackage +  "_free." + ext[4];
	//checkLink(linkRGSFree);
	linkRGSFull = server[1] + path[1] + gameNamePackage +  "_full." + ext[4];
	//checkLink(linkRGSFull);
}

function createLinksDMG() {
	linkDMGLegacy = server[7] + path[6] + gameNamePackage +  "." + ext[3];
	//checkLink(linkDMGLegacy);
	linkDMGNew = server[7] + path[6] + "amac-" + gameNamePackage +  "." + ext[3];
	//checkLink(linkDMGNew);
}

function checkLink(linkToCheck){
	var chk = new XMLHttpRequest();
	chk.open("HEAD", linkToCheck, true);
	 chk.onreadystatechange=function() {
		
	 }
	 chk.send(null);
	 linkStatusEXE = chk.status;
}

/*
// Check New Link
function checkLink(linkToCheck){
	linkCheckRequest = getHTTPRequest();

	try {
	linkCheckRequest.open("GET", linkToCheck, true);
	linkCheckRequest.send("");
	} 
	catch (e) {
		success = false;
		error_msg = "Error: " + e;
	}
	
	if(linkToCheck == linkEXE){linkStatusEXE = linkCheckRequest.status;}
	if(linkToCheck == linkRFS){linkStatusRFS = linkCheckRequest.status;}
	if(linkToCheck == linkDMGLegacy){linkStatusDMGLegacy = linkCheckRequest.status;}
	if(linkToCheck == linkDMGNew){linkStatusDMGNew = linkCheckRequest.status;}
	if(linkToCheck == linkRGANoLang){linkStatusRGANoLang = linkCheckRequest.status;}
	if(linkToCheck == linkRGALang){linkStatusRGALang = linkCheckRequest.status;}
	if(linkToCheck == linkRGALegacy){linkStatusRGALegacy = linkCheckRequest.status;}
	if(linkToCheck == linkRGATrial){linkStatusRGATrial = linkCheckRequest.status;}
	if(linkToCheck == linkRGAUnlimited){linkStatusRGAUnlimited = linkCheckRequest.status;}
	if(linkToCheck == linkRGSFree){linkStatusRGSFree = linkCheckRequest.status;}
	if(linkToCheck == linkRGSFull){linkStatusRGSFull = linkCheckRequest.status;}
}
*/

/*
// Get HTTP Request Status
function getHTTPRequest() {
    var request = false;
    if(window.XMLHttpRequest) {
        try {
            request = new XMLHttpRequest();
        } catch(e) {
            request = false;
        }
    } else if(window.ActiveXObject) {
        try {
            request = new ActiveXObject("Microsoft.XMLHTTP");
        } catch(e) {
            request = false;
        }
    }
    if (! request) {
        //alert("Your browser does not support XMLHttpRequest.");
    }
    return request;
}
*/

// Clone Element
function cloneElement(nodeToClone, newID) {
	var dup = 0;
	var srcNode = document.getElementById(nodeToClone);
    var destNode = srcNode.cloneNode(true);
    //destNode.id = newID + ++dup;
    destNode.id = newID;
    srcNode.parentNode.appendChild(destNode);
}

// Remove Node
function removeElement(nodeToRemove){
	var getElement = document.getElementById(nodeToRemove);
	var nodeGetParent = getElement.parentNode;
	nodeGetParent.removeChild(getElement);
	//alert("Removed " + nodeToRemove);
}

// Remove Images/Pictures With "img" Tag
function removeImage(imageNumberToRemove){
	var imageName = document.getElementsByTagName('img')[imageNumberToRemove];
	imageName.parentNode.removeChild(imageName);
	
}

// Insert Script (Nabbed From GameHouse Page Source!!)
function insertScript() {
    //var vScript = document.createElement('script');
    //vScript.type = 'text/javascript'; vScript.async = true;
    //vScript.src = 'file.js';
    //vScript.onload = function(){_v = new VeediEmbed(settings);};
    //var veedi = document.getElementById('veediInit'); veedi.parentNode.insertBefore(vScript, veedi);
}

// Dropdown Box Test
function createDropdownBox() {
	var dropdown = "<div id=\"dropdown\"><select id=" + "dropdownTest" + "><option value=" + "1" + ">Option 1</option></select></div>";
	var a = document.getElementById("game_description");
	//var b = document.createElement(dropdown);
	//a.setAttribute("class", "dl_now_button"):
	//a.insertBefore(b, a.nextSibling);
	//alert(dropdown);
	//a.innerHTML = dropdown;
}

function createTextBox(elem) {
	var elementNextTo = document.getElementById(elem);
	var txtBox = document.createElement('input'); 
	txtBox.type = "text";
	elementNextTo.appendChild(txtBox);
}

function createAdvancedOptions() {
	var dropdownServer = "<select id=" + "dropdownServer" + "><option value=" + "1" + ">" + server[0] + "</option><option value=" + "2" + ">" + server[1] + "</option><option value=" + "3" + ">" + server[2] + "</option><option value=" + "4" + ">" + server[3] + "</option><option value=" + "5" + ">" + server[4] + "</option><option value=" + "6" + ">" + server[5] + "</option><option value=" + "7" + ">" + server[6] + "</option><option value=" + "8" + ">" + server[7] + "</option></select>";
	var dropdownPath = "<select id=" + "dropdownPath" + "><option value=" + "1" + ">" + path[0] + "</option><option value=" + "2" + ">" + path[1] + "</option><option value=" + "3" + ">" + path[2] + "</option><option value=" + "4" + ">" + path[3] + "</option><option value=" + "5" + ">" + path[4] + "</option><option value=" + "6" + ">" + path[5] + "</option></select>";
	var dropdownChannel = "<select id=" + "dropdownChannel" + "><option value=" + "1" + ">" + channel[0] + "</option></select>";
	var dropdownLanguage = "<select id=" + "dropdownLanguage" + "><option value=" + "1" + ">" + language[0] + "</option><option value=" + "2" + ">" + language[1] + "</option><option value=" + "3" + ">" + language[2] + "</option><option value=" + "4" + ">" + language[3] + "</option></select>";
	var dropdownDistributor = "<select id=" + "dropdownDistributor" + "><option value=" + "1" + ">" + distributor[0] + "</option></select>";
	var dropdownFileType = "<select id=" + "dropdownFileType" + "><option value=" + "1" + ">" + ext[0] + "</option><option value=" + "2" + ">" + ext[1] + "</option><option value=" + "3" + ">" + ext[2] + "</option><option value=" + "4" + ">" + ext[3] + "</option><option value=" + "5" + ">" + ext[4] + "</option><option value=" + "6" + ">" + ext[5] + "</option><option value=" + "7" + ">" + ext[6] + "</option><option value=" + "8" + ">" + ext[7] + "</option></select>";
	var dropdownDeveloper = "<select id=" + "dropdownDeveloper" + "><option value=" + "1" + ">" + developer[0] + "</option><option value=" + "2" + ">" + developer[1] + "</option><option value=" + "3" + ">" + developer[2] + "</option><option value=" + "4" + ">" + developer[3] + "</option><option value=" + "5" + ">" + developer[4] + "</option><option value=" + "6" + ">" + developer[5] + "</option></select>";
	var dropdownOffering = "<select id=" + "dropdownOffering" + "><option value=" + "1" + ">" + offering[0] + "</option><option value=" + "2" + ">" + gameNamePackage + "</option></select>";
	
	var comboFirstRow = "<b>Type: </b>" + dropdownFileType + "&nbsp&nbsp&nbsp&nbsp&nbsp<b>Distributor: </b>" + dropdownDistributor + "&nbsp&nbsp&nbsp&nbsp&nbsp<b>Developer:&nbsp</b>" + dropdownDeveloper + "&nbsp&nbsp&nbsp&nbsp&nbsp<b>Language:&nbsp</b>" + dropdownLanguage;
	var comboSecondRow = "<b>Channel:&nbsp</b>" + dropdownChannel + "&nbsp&nbsp&nbsp&nbsp&nbsp<b>Offering:&nbsp</b>" + dropdownOffering;

	//var formPre = "<form>";
	//var formPost = "</form>";
	//var txtBox = "<input type=\"text\" name=\"txtBox\">";

	//var comboDropdown = formPre + comboFirstRow + "<br>" + txtBox + "<br>" + comboSecondRow + formPost;
	var comboDropdown = comboFirstRow + "<br><br>" + comboSecondRow;
	
	hijackGameDescription(comboDropdown, "#FFFFFF");
}

// Force Page Load To Stub
function forceStubPage() {
	var p = window.location.pathname;
	pathX = p.replace("download-games", "pc/postdownload");
	//alert(pathX);
	window.location = pathX;
}

// Parse Game Page Links on New Games Webpage
function parseGamePageLinks() {
	var gamesContainer = document.getElementById("_games_container");
	var gameModule = document.getElementById("_game_module");
	var gameList = document.getElementsByClassName("widgetContent2 games list dynamic");
	var game1 = document.getElementById("game_1");
	
	
	//alert(game1);
}

// Get ACID Config Settings (Pulled From Stub Install Log)
function getAcidConfig() {
	// Sample URL: 
	// http://installer-manager.gamehouse.com/InstallerManager/getinstallersettings?installationid=0a5297a8531946c690446eab6baad53e&component=acid&version=1.20
	var configFile = baseAcidConfig + iid + postAcidConfig;
	window.location = configFile;
}

// Credits
function shamelessPlug(){
	var credits = "esc0rtd3w / cRypTiCwaRe 2016";
}

// Hijack Links
function hijackButtonLink(hjElement, hjLink, hjClass){
	
	var hijackID = document.getElementById(hjElement);
	hijackID.setAttribute("href", hjLink);
	hijackID.setAttribute("class", hjClass);
	
	// Clear Original Button Text
	hijackID.innerHTML = "";
}

function hijackButtonText(hjElement, txtElementMain, txtElementSub, txtClassMain, txtClassSub, txtMainNew, txtSubNew){
	
	var hijackID = document.getElementById(hjElement);
	
	// Clear Original Button Text
	hijackID.innerHTML = "";
	
	// Text Modifier Main Button Text
	var spanHijackTextMain = document.createElement(txtElementMain);
	spanHijackTextMain.setAttribute("class", txtClassMain);
	spanHijackTextMain.innerHTML = txtMainNew;

	// Text Modifier Sub Button Text
	var spanHijackTextSub = document.createElement(txtElementSub);
	spanHijackTextSub.setAttribute("class", txtClassSub);
	spanHijackTextSub.innerHTML = txtSubNew;

	// Insert New Text Into Current Page
	hijackID.insertBefore(spanHijackTextMain, hijackID.nextSibling);
	hijackID.insertBefore(spanHijackTextSub, hijackID.nextSibling);
}

// Hijack Funpass Button
function hijackButtonFunpass(hjElement, hjLink){

	// Sample Default Funpass Button
	// <div id="funpass_btn">
	//<a href="/memberships/funpass/freetrial" class="funpass">
	//<span class="cta">Unlimited Play</span>
	//<span class="secondary">With FunPass FREE trial.</span>
	//</a>
	//</div>
	
	// Button Modifier
	var hijackClass = document.getElementsByClassName(hjElement)[0].innerHTML;
	//alert(hijackClass);
	hijackClass.setAttribute("href", hjLink);

	// Clear Original Button Text
	hijackClass.innerHTML = "";
}

// Create New Hijacked Buttons
function buildNewButtons() {

	// Clone and Remove Original "Play Now" Button
	cloneElement(btnPlayNow, btnHijack);// Clone Hijacked "Play Now" Button To A New ID
	removeElement(btnPlayNow);// Remove Original "Play Now" Button
	
	// Create New Buttons From Hijack Clone
	cloneElement(btnHijack, btnHijackEXE);// Create an EXE File Button From Hijack Clone
	cloneElement(btnHijack, btnHijackRFS);// Create an RFS File Button From Hijack Clone
	cloneElement(btnHijack, btnHijackDMGLegacy);// Create an DMG Legacy File Button From Hijack Clone
	cloneElement(btnHijack, btnHijackDMGNew);// Create an DMG AMAC File Button From Hijack Clone
	cloneElement(btnHijack, btnHijackRGANoLang);// Create an RGA v4.x Without Language File Button From Hijack Clone
	cloneElement(btnHijack, btnHijackRGALang);// Create an RGA v4.x With Language File Button From Hijack Clone
	cloneElement(btnHijack, btnHijackRGALegacy);// Create an RGA v2.1 File Button From Hijack Clone
	cloneElement(btnHijack, btnHijackRGATrial);// Create an RGA v2.6 Trial File Button From Hijack Clone
	cloneElement(btnHijack, btnHijackRGAUnlimited);// Create an RGA v2.6 Unlimited File Button From Hijack Clone
	cloneElement(btnHijack, btnHijackRGSFree);// Create an RGS Free File Button From Hijack Clone
	cloneElement(btnHijack, btnHijackRGSFull);// Create an RGS Full File Button From Hijack Clone
	//cloneElement(btnHijack, btnHijackAdvanced);// Create an Advanced Settings Button From Hijack Clone
	
	if (iid != "00000000000000000000000000000000") {
		cloneElement(btnHijack, btnHijackAcid);// Create an Acid Config File Button From Hijack Clone
	}
	//cloneElement(btnHijack, btnHijackOriginVuln);// Create a Button That redirects to a vulnerable GH server From Hijack Clone
	
	if(advancedOptions == 1) {
		cloneElement(btnHijack, btnHijackAdvanced);// Create a Button Based On Advanced Settings From Hijack Clone
	}
	
	// Remove Original Hijack Clone
	removeElement(btnHijack);
}

// Set Button Properties
function setButtonProperties(btn, lnk, textMain, textSub, colorMain, colorSub) {
	
	var btnHijackTarget = document.getElementById(btn);
	btnHijackTarget.innerHTML = "<span class=" + "\"cta\"" + ">" + "<font color=\"" + colorMain + "\">" + textMain + "</font>" + "</span><span class=" + "\"secondary\"" + ">" + "<font color=\"" + colorSub + "\">" + textSub + "</font>" + "</span><br>";
	btnHijackTarget.outerHTML = "<a href=" + lnk + " id=" + btn + " class=\"download\">" + btnHijackTarget.innerHTML + "</a>&nbsp&nbsp&nbsp&nbsp";
	//btnHijackEXEElement.style.margin = "0px, 50px, 50px, 0px";
}

// Clear Game Description for Custom Text
function hijackGameDescription(customText, color) {
	
	cloneElement("game_desc", "game_desc_hijacked");

	// Remove Game Description
	removeElement("game_desc");
	removeElement("show_more");
	removeElement("show_less");
	
	hijackDescription = document.getElementById("game_desc_hijacked");
	//var hijackDescBackup = hijackDescription.innerHTML;
	hijackDescription.innerHTML = "";
	//hijackDescription.style.height = "95px";// Adjust container height
	//hijackDescription.style.marginBottom = "10px";
	hijackDescription.style.marginBottom = "10px";
	
	// Enter New HTML Into Description
	hijackDescription.innerHTML = "<font color=\"" + color + "\">" + customText + "</font>";
}

// Add an extra area in game description to put custom text
function addExtendedDescription(){
	var txt = "<b>Content ID: <font color=\"#FFFFFF\">" + cid + "</font></b><br><br>You can select advanced options by using the dropdown boxes below:";
	cloneElement("game_desc_hijacked", "game_desc_hijacked_extended");
	var x = document.getElementById("game_desc_hijacked");
	x.style.height = "55px";// Adjust Height
	//x.style.paddingTop = "10px";
	//x.style.paddingBottom = "10px";
	x.style.marginBottom = "10px";
	x.innerHTML = txt;
}

// Clear "Or Buy" Area for Custom Text
function hijackBuyText(customText, color) {
	
	cloneElement("buy_now_button", "buy_now_button_hijacked");

	// Remove Buy Text
	removeElement("buy_now_button");// Remove "Or Buy" Text
	
	hijackBuy = document.getElementById("buy_now_button_hijacked");
	hijackBuy.innerHTML = "";
	
	// Enter New Text Into Buy Area
	hijackBuy.innerHTML = "<font color=\"" + color + "\">" + customText + "</font>";
	
	// Set New URL (Optional)
	//var buyLink = "https://www.google.com/search?num=100&newwindow=1&site=&source=hp&q=" + gameNameTitle;
	var buyLink = "mailto:esc0rtd3w@gmail.com?subject=[gh-package-tool] Broken Link For " + gameNameTitle;
	hijackBuy.setAttribute("onclick", buyLink);
	hijackBuy.setAttribute("href", buyLink);
}

// Clear "New Games" Area for Custom Text
function hijackNewGamesArea(textHeader, colorHeader) {
	
	//cloneElement("seocategorytitle", "seocategorytitle_hijacked");
	//cloneElement("pageDesc", "pageDesc_hijacked");

	//removeElement("seocategorytitle");
	//removeElement("pageDesc");
	
	hijackNewGamesHeader = document.getElementById("pageDesc");
	//hijackNewGamesHeader.innerHTML = "";
	
	//hijackNewGamesDesc = document.getElementById("seocategorytitle");
	//hijackNewGamesDesc.innerHTML = "";
	
	// Enter New Text Into New Games Area
	hijackNewGamesHeader.innerHTML = "<font color=\"" + colorHeader + "\">" + textHeader + "</font>";
	//hijackNewGamesDesc.innerHTML = "<h5><font color=\"" + colorDesc + "\">" + textDesc + "</font></h5>";
}

// Remove Extra Margin From Top of Buttons
function shrinkMargin(elem, size) {
	var a = document.getElementById(elem);
	a.style.marginTop = size;
}

function checkLogin() {
	var signInLink = document.getElementById("signInLink");
	
	if (document.contains(signInLink)) {
	var signInText = signInLink.innerHTML;
	/*
	if (signInText == "Sign In"){
		isLoggedIn = 0;
		}
		else {
			isLoggedIn = 1;
		}
		*/
		
		isLoggedIn = 0;
	}
	else {
		isLoggedIn = 1;
	}
}

function checkFavorites() {
	var checkFull = 0;
	var checkEmpty = 0;
	var checkTemp = 0;
	
	var full = document.getElementById("fav_button_full");
	var empty = document.getElementById("fav_button_empty");
	
	if (full == "undefined"){
		checkFull = 0;
		}
		else {
			checkFull = 1;
		}
	if (empty == "undefined"){
		checkEmpty = 0;
		}
		else {
			checkEmpty = 1;
		}
	
	checkTemp = checkFull + checkEmpty;
	
	if (checkTemp > 0) {
		isFavHeart = 1;
	}
	else {
		isFavHeart = 0;
	}
}

function cleanElements() {
	//removeElement(btnPlayNow);// This is removed during the hijacked button building
	removeElement(btnFunpass);// Remove The Orange Funpass Button
	//removeElement(btnFreePlay);// Remove The Freeplay Button
	if (isFavHeart == 1 && isLoggedIn == 1) {
		removeElement("fav_button_full");// Remove Favorite Heart Image FULL
		removeElement("fav_button_empty");// Remove Favorite Heart Image EMPTY
	}
}

function downloadFile(file, fullPath) {
	var dl = document.createElement('a');
	dl.download = file;
	dl.href = fullPath;

	var clickEvent = document.createEvent("MouseEvent");
	clickEvent.initEvent("click", true, true);

	dl.dispatchEvent(clickEvent);
}

// END FUNCTIONS ----------------------------------------------------------------------/



// START MAIN TOOL --------------------------------------------------------------------/

// Hijack Game Page Text On Main Pages
//hijackNewGamesArea("<h3><b>GameHouse Package Tool Is Currently Active</b></h3><br><i>This special script is running to make your visit a little more enjoyable ;)</i><br><br>", "#000000");

// Get root path of webpage after server base
getRootPath();

// Get Some Basic Info
getCID();
getGameName();

// Build All Available New Links Based on Content ID and Game Name
buildNewLinks();

// Check if User is Logged In
checkLogin();

// Check For Favorite Hearts (Shows only if logged in)
checkFavorites();

// Remove Unwanted Stuff From Webpage
cleanElements();

// Remove "Funpass Playable" Image
// Sample Element: <img src="//cdn.ghstatic.com/gamehouse/images/GH_funpass_Playable.png?20160314.132.1" class="playable">
// This will remove the wrong pic if image order is changed on Gamehouse, or if page is not Funpass Playable
//removeImage(4);

// Hijack Game Description
createAdvancedOptions();

// Hijack Buy Text
hijackBuyText("Report Broken Links To: <br>esc0rtd3w@gmail.com", "#FFFFFF");

//createTextBox();

// Other Testing Start

//parseGamePageLinks();
//forceStubPage();// Force Load To /pc/postdownload/ and Retrieve EXE Stub
//showAllGames();// Can cause LONG LOAD TIMES!!
//createDropdownBox();

//getAcidConfig();

// Other Testing End

addExtendedDescription();

shrinkMargin("callToAction", "0px");// Shrink Extra Margin Space Between Description Text and Buttons

// Hijack Button Links
//hijackButtonLink(btnPlayNow, linkHijack, "download");

// Build New Hijacked Buttons
buildNewButtons();

// Set Button Properties
setButtonProperties(btnHijackEXE, linkEXE, "EXE File", "Default Stub Installer", "#00ccFF", "#FFFFFF");
setButtonProperties(btnHijackRFS, linkRFS, "RFS File", "New AM Package", "#FF4433", "#FFFFFF");
setButtonProperties(btnHijackDMGLegacy, linkDMGLegacy, "DMG File", "Mac Legacy", "#FFFF00", "#FFFFFF");
setButtonProperties(btnHijackDMGNew, linkDMGNew, "DMG File", "Mac ActiveMark", "#FFFF00", "#FFFFFF");
setButtonProperties(btnHijackRGALang, linkRGALang, "RGA File", "AM v4.x + Language", "#FF88AA", "#FFFFFF");
setButtonProperties(btnHijackRGANoLang, linkRGANoLang, "RGA File", "AM v4.x Default", "#FF88AA", "#FFFFFF");
setButtonProperties(btnHijackRGALegacy, linkRGALegacy, "RGA File", "AM v2.1 Legacy", "#FF88AA", "#FFFFFF");
setButtonProperties(btnHijackRGATrial, linkRGATrial, "RGA File", "AM v2.6 Trial", "#FF88AA", "#FFFFFF");
setButtonProperties(btnHijackRGAUnlimited, linkRGAUnlimited, "RGA File", "AM v2.6 Unlimited", "#FF88AA", "#FFFFFF");
setButtonProperties(btnHijackRGSFree, linkRGSFree, "RGS File", "RealArcade Free", "#9900FF", "#FFFFFF");
setButtonProperties(btnHijackRGSFull, linkRGSFull, "RGS File", "RealArcade Full", "#9900FF", "#FFFFFF");
//setButtonProperties(btnHijackAdvanced, linkAdvanced, "RGS File", "RealArcade Full", "#9900FF", "#FFFFFF");
setButtonProperties(btnHijackAcid, linkAcid, "Acid File", "Configuration File", "#99ffFF", "#FFFFFF");
//setButtonProperties(btnHijackOriginVuln, linkOriginVuln, "Surprise!", "GH Origin Server", "#22BB77", "#FFFFFF");

// Custom Advanced Button
if (advancedOptions == 1) {
	var advMainText = "Custom" + "&nbsp&nbsp";// Must be 8 Characters To Line Up With Defaults
	var advSubText = "Advanced Options";
	setButtonProperties(btnHijackAdvanced, linkAdvanced, advMainText, advSubText, "#22BB77", "#FFFFFF");
}

// END MAIN TOOL ----------------------------------------------------------------------/
