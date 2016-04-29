/*
|
|	We need to disable the context menu
|
|   PLEASE NOTE: This file has been modified to work with the smaller subset of the GH installer UI displays. 
|   Things have been commented out, but not removed as future versions of the GH installer will likely make use of them.
|   
*/
document.attachEvent("oncontextmenu", contextMenuHandler);

function contextMenuHandler() {
	event.returnValue = false;
}

/* 
|	 
|	The RAINSTALLER object will be used by the games service
|	installer to implement namespacing
|
*/
if ( typeof RAINSTALLER == "undefined" ) {
	var RAINSTALLER = {};
}

try {
	RAINSTALLER.RACInstallerControl = new ActiveXObject("RACInstaller.StateCtrl");
}
catch(e) {
	alert("Error creating RACInstallerControl");
	window.close();
}

/* 
|	
|	RAINSTALLER 
|	Global Properties and Methods
|
*/
RAINSTALLER.clearChildNodes = function ( nParent ) {
	try {
		while ( nParent.firstChild ) {
			nParent.removeChild( nParent.firstChild );
		}
	}
	catch(e) {
		//alert(e);
	}
};

RAINSTALLER.getChildElementsByTagName = function ( nParent, tagName ) {
	try {
		var arrChildren = new Array();	
		var kids = nParent.childNodes;
		for(i=0; i<kids.length; i++) {
			if( kids[i].nodeName == tagName ) {
				arrChildren.push(kids[i]);
			}
		}
		return arrChildren;
	}
	catch(e) {
		return null;
	}
};

RAINSTALLER.getChildElementById = function ( nParent, id ) {
	try {
		var kids = nParent.childNodes;
		for(i=0; i<kids.length; i++) {
			if( kids[i].id == id ) {
				return(kids[i]);
			}
		}
	}
	catch(e) {
		return null;
	}
};

RAINSTALLER.appendTextNode = function ( parentid, text ) {
	try {
		document.getElementById(parentid).appendChild( document.createTextNode( text ) );
	}
	catch(e) {
		//alert(e);
	}		
};

RAINSTALLER.getGameImageTinySquare = function ( gameId ) {
	try {
		return encodeURI( "http://www.realarcade.com/gameimage?gameid=" + gameId + "&gametype=download&imagetype=Image Set Tiny Square Image" );
	}
	catch(e) {
		//return "";
	}
};

RAINSTALLER.callLoadComplete = function () {
	try {
		setTimeout( "RAINSTALLER.RACInstallerControl.JSLoadComplete()", 10 );
	}
	catch(e) {
		//alert(e)
	}
};

RAINSTALLER.trackPageAsEvent = function () {
	try {
		//RAINSTALLER.omniture.trackLink( { pageName:'omniture', eventName:RAINSTALLER.pageName, linkType:'o', linkTrackEvents:[ 'event8' ]} );	
		RAINSTALLER.omniture.trackLink( { pageName:'', eventName:RAINSTALLER.pageName, linkType:'o', linkTrackVars:{ eVar17:RAINSTALLER.var17 }, linkTrackEvents:[ 'event8' ]} );		
	}
	catch(e) {
		//alert(e)
	}
};

RAINSTALLER.getValueFromPair = function (str) {
	try {
		return str.substr( str.indexOf("=") + 1 );
	}
	catch(e) {
		return "";
	}
}

RAINSTALLER.toggleElementDisplay = function (id) {
	try {
		var elem = document.getElementById(id);
		elem.style.display = elem.style.display == "block" ? "none" : "block";
	} 
	catch(e) {
		// alert(e);
	}
}

// set this property on each .jsp page to track the page as an event
// - default to "" -
RAINSTALLER.pageName = "";
RAINSTALLER.products = null;

/* 
|	
|	RAINSTALLER 
|	Migration page Properties and Methods
|
*/
RAINSTALLER.omniture = {};
RAINSTALLER.omniture.trackEvents = true;

/* 
|	
|	RAINSTALLER 
|	RAINSTALLER.omniture.trackLink
|	Sends a link 'ping' to Omniture
|	@param Object o
|
|   Sample input

	var o = { 	pageName:"Eula Setup Options",
				eventName:"I:  Check:  EULA", 
				linkType:"o", 
				linkTrackVars:{ var1:"var1value", var2:"var2value" },
				linkTrackEvents:[ "event8" ],
				variableOverrides:{ ov1:"over1", ov2:"over2" },
				products:{products}
*/
RAINSTALLER.omniture.trackLink = function ( o ) {
	try {
		if( RAINSTALLER.omniture.trackEvents ) {
			//create an Omniture tracking instance
			var s = s_gi(s_account);
			
			//set channel to "Installer" for every Omniture ping from the installer
			s.channel = "Installer";

			//set a link type: e=exit, d=download, o=custom (default)
			var linkType = ( (o.linkType == "e" && o.linkType) || (o.linkType == "d" && o.linkType) || "o" );
			
			//omniture says we need to set prop18 to the event name
			if ( o.eventName ) {
				s.prop18 = o.eventName;
				s.linkTrackVars = "prop18";
			}
			
			s.products = RAINSTALLER.products;
			//override the product if desired
			if ( o.products ) {
				s.products = o.products;
			}
		
			//assign link tracking variables, if any
			if ( o.linkTrackVars ) {
				for ( i in o.linkTrackVars ) {
					s[i] = o.linkTrackVars[i];
					s.linkTrackVars += "," + i;
				}	
			}
			
			//track events, if any
			if ( o.linkTrackEvents ) {
				s.linkTrackEvents = o.linkTrackEvents.join(",");
				if ( s.linkTrackVars.length > 0 ) s.linkTrackVars += ",";
				s.linkTrackVars += "events";
				s.events = s.linkTrackEvents;
			}
	
			//override page-level variables here
			if ( o.variableOverrides ) {
				for( i in o.variableOverrides ) {
					s[i] = o.variableOverrides[i];
				}
			}
			
			/*	//UNCOMMENT FOR DEBUGGING ONLY 
			var outstr = "linkTrackVars= " + s.linkTrackVars + "\n" + "linkTrackEvents=" + s.linkTrackEvents + "\n" + "linkType= " + linkType + "\n" + "Events=" + s.events + "\n" + "Event name=" + o.eventName + "\n" + "s.eVar17=" + s.eVar17 + "\n" + "s.prop18=" + s.prop18 + "\n" + "s.products=" + s.products + "\n";	
			if ( o.variableOverrides ) {
				for( i in o.variableOverrides ) {
					outstr += i + " = " + o.variableOverrides[i] + "\n";
				}
			}
			alert( outstr )
			   	//END UNCOMMENT FOR DEBUGGING ONLY
			*/
			
			
			//send info to Omniture
			s.tl( true, linkType, o.eventName );
		}
	}
	catch(e) {
		//alert(e);
	}
};

/* 
|	
|	RAINSTALLER 
|	Migration page Properties and Methods
|
*/
RAINSTALLER.migration = {};

RAINSTALLER.migration.trackEvents = true;

RAINSTALLER.migration.nextButtonAction = function () {
	if( window.actionClicked != true ) {
		window.actionClicked = true;
		
		RAINSTALLER.omniture.trackLink( { pageName:'', eventName:'E: Migration start', linkType:'o', linkTrackVars:{ eVar17:'' }, linkTrackEvents:[ 'event15' ]} );		
		setTimeout( "RAINSTALLER.RACInstallerControl.Next()", 500);
	}
};
							
RAINSTALLER.migration.cancelButtonAction = function () {
	if( window.actionClicked != true ) {
		window.actionClicked = true;
		
		RAINSTALLER.omniture.trackLink( { pageName:'migration', eventName:'I:  Button:  Cancel', linkType:'e', linkTrackEvents:[ 'event8' ]} );		
		RAINSTALLER.RACInstallerControl.Exit();
	}
};



/* 
|	
|	RAINSTALLER 
|	Eula page Properties and Methods
|
*/
RAINSTALLER.eula = {};
RAINSTALLER.eula.trackEvents = true;

RAINSTALLER.eula.getDefaultInstallPath = function () {
	try {
		return RAINSTALLER.RACInstallerControl.InstallPath;
	}	
	catch(e) {
		return "";
	}
};

RAINSTALLER.eula.chooseInstallPath = function () {
	try {
		RAINSTALLER.RACInstallerControl.DisplayfolderChooser();
	}
	catch(e) {
		//alert(e);
	}			
};

RAINSTALLER.eula.updateInstallPath = function ( path ) {
	try {
		document.getElementById("installPath").value= path;
	}
	catch(e) {
		//alert(e);
	}	
};
	
RAINSTALLER.eula.toggleSettings = function () { 
	try {
		document.getElementById("setupOptions").className = "setupOptionsDisplay";
		document.getElementById("changeSettingsLink").style.display = "none";
		document.getElementById("changeSettingsText").style.display = "none";	
	}
	catch(e) {
		//alert(e);
	}			
 };
 
 RAINSTALLER.eula.backButtonAction = function () {
	if( window.actionClicked != true ) {
		window.actionClicked = true;

		try {
			RAINSTALLER.RACInstallerControl.Previous();
		}
		catch(e) {
			//alert(e);
		}
	}
};

RAINSTALLER.eula.cancelButtonAction = function () {
	if( window.actionClicked != true ) {
		window.actionClicked = true;

		try {
			//var surveyWin = window.open('http://www.surveymonkey.com/s.aspx?sm=7NQSjj_2b2Ierv61uAbrlfcw_3d_3d');
			setTimeout( "RAINSTALLER.RACInstallerControl.Exit()", 500 );
		}
		catch(e) {
			//alert(e);
		}
	}
};
								 
RAINSTALLER.eula.nextButtonAction = function ( staticFileBase ) {
	if( window.actionClicked != true ) {
		window.actionClicked = true;

		try {
		
			if (document.getElementById("installPath"))
			{
				var installPath = document.getElementById("installPath").value;
				if (installPath.charAt(installPath.length-1) == '\\')
				{
					installPath = installPath.substring(0, installPath.length-1);
				}
				var re = new RegExp("^([a-z])\:$", "i");
				if (installPath.match(re))
				{
						document.getElementById("error").style.display = "block";
						window.actionClicked = false;

				}
				else
				{
					if(	document.getElementById("addToFavorites") && !document.getElementById("addToFavorites").checked ) {
						RAINSTALLER.RACInstallerControl.RemoveTag("BookmarkDrop");	
					}
					if(	document.getElementById("addDesktopShortcut") && !document.getElementById("addDesktopShortcut").checked ) {
						RAINSTALLER.RACInstallerControl.RemoveTag("GameDrop");	
					}
					var pingStr = "&src=rac_installer&state=interim&slide=eula&accept=yes"
					RAINSTALLER.RACInstallerControl.Ping( pingStr );
					RAINSTALLER.RACInstallerControl.Next();
				}
			}		
		}
		catch(e) {
			//alert();
		}			
	}
};		

/* 
|	
|	RAINSTALLER 
|	Google Promo page Properties and Methods
|
*/
RAINSTALLER.googlePromo = {};
RAINSTALLER.googlePromo.trackEvents = true;

RAINSTALLER.googlePromo.backButtonAction = function () {
	if( window.actionClicked != true ) {
		window.actionClicked = true;

		RAINSTALLER.RACInstallerControl.Previous();
	}
};
								 
RAINSTALLER.googlePromo.nextButtonAction = function () {
	if( window.actionClicked != true ) {
		window.actionClicked = true;
		var fireEvent = false;
		
		try {

			if(document.getElementById("include_gtbar") && document.getElementById("include_gtbar").checked) {		
				fireEvent = true;
			}
			if(document.getElementById("include_gtbar") && !document.getElementById("include_gtbar").checked) {		
				RAINSTALLER.RACInstallerControl.RemoveTag("GoogleToolbar");
			}			
		
			if( fireEvent ) RAINSTALLER.omniture.trackLink( { pageName:'', eventName:'Installer: Google DLPR accept', linkType:'o', linkTrackVars:{ eVar17:'Installer: Google DLPR accept' }, linkTrackEvents:[ 'event14' ]} );			
			setTimeout( "RAINSTALLER.RACInstallerControl.Next()", 500);																															
		}
		catch(e) {
			//alert(e)
		}
	}
};		

/* 
|	
|	RAINSTALLER 
|	Firefox Promo page Properties and Methods
|
*/
RAINSTALLER.firefoxPromo = {};
RAINSTALLER.firefoxPromo.trackEvents = true;

RAINSTALLER.firefoxPromo.backButtonAction = function () {
	if( window.actionClicked != true ) {
		window.actionClicked = true;

		RAINSTALLER.RACInstallerControl.Previous();
	}
};

RAINSTALLER.firefoxPromo.nextButtonAction = function () {
	if( window.actionClicked != true ) {
		window.actionClicked = true;
		var fireEvent = false;
		
		try {
			var radioGp = document.forms[0].firefoxOffer;
			
			for( i = 0; i < radioGp.length; i++ ) {
				if ( ("InstallFirefox" == radioGp[i].value) && radioGp[i].checked ) {
					fireEvent = true;
				}	
				if ( ("FirefoxLater" == radioGp[i].value) && radioGp[i].checked ) {
					RAINSTALLER.RACInstallerControl.RemoveTag("InstallFirefox");
				}	
				if ( ("FirefoxNever" == radioGp[i].value) && radioGp[i].checked ) {
					RAINSTALLER.RACInstallerControl.RemoveTag("InstallFirefox");												
					RAINSTALLER.RACInstallerControl.RemoveTag("ContinueOfferingFirefox");
				}																			
			}		
			if( fireEvent ) RAINSTALLER.omniture.trackLink( { pageName:'', eventName:'E: Installer: Firefox DLPR accept', linkType:'o', linkTrackVars:{ eVar17:'Installer: Firefox DLPR accept' }, linkTrackEvents:[ 'event14' ]} );
			setTimeout( "RAINSTALLER.RACInstallerControl.Next()", 500);																															
		}
		catch(e) {
			//alert(e)
		}
	}
};


/* 
|	
|	RAINSTALLER 
|	Chrome Promo page Properties and Methods
|
*/
RAINSTALLER.chromePromo = {};
RAINSTALLER.chromePromo.trackEvents = true;

RAINSTALLER.chromePromo.backButtonAction = function () {
	if( window.actionClicked != true ) {
		window.actionClicked = true;

		RAINSTALLER.RACInstallerControl.Previous();
	}
};

RAINSTALLER.chromePromo.nextButtonAction = function () {
	if( window.actionClicked != true ) {
		window.actionClicked = true;
		var fireEvent = false;
		
		try {

			if(document.getElementById("include_chrome") && document.getElementById("include_chrome").checked) {		
				fireEvent = true;
			}
			if(document.getElementById("include_chrome") && !document.getElementById("include_chrome").checked) {		
				RAINSTALLER.RACInstallerControl.RemoveTag("InstallChrome");
			}			
			if(document.getElementById("default_chrome") && !document.getElementById("default_chrome").checked){		
					RAINSTALLER.RACInstallerControl.RemoveTag("InstallChrome2");
			}
		
			if( fireEvent ) RAINSTALLER.omniture.trackLink( { pageName:'', eventName:'E: Installer: Google Chrome DLPR accept', linkType:'o', linkTrackVars:{ eVar17:'Installer: Google Chrome DLPR accept' }, linkTrackEvents:[ 'event14' ]} );
			setTimeout( "RAINSTALLER.RACInstallerControl.Next()", 500);																															
		}
		catch(e) {
			//alert(e)
		}
	}
};

/* 
|	
|	RAINSTALLER 
|	Chrome Install Complete page Properties and Methods
|
*/
RAINSTALLER.chromeInstallComplete = {};
RAINSTALLER.chromeInstallComplete.trackEvents = true;

RAINSTALLER.chromeInstallComplete.launchChromeAction = function () {
	if( window.actionClicked != true ) {
		window.actionClicked = true;
		try {
			RAINSTALLER.omniture.trackLink( { pageName:'', eventName:'E: Installer: Chrome Install Complete: Launch button click', linkType:'o', linkTrackVars:{ eVar17:'' }, linkTrackEvents:[ 'event8' ]} );
			setTimeout( "RAINSTALLER.RACInstallerControl.Next()", 500);																								
		}
		catch(e) {
			//alert(e)
		}			
	}
};


RAINSTALLER.chromeChange = function(){
	try{
	if(document.getElementById('include_chrome').checked){
		document.getElementById('default_chrome').checked = true;
		document.getElementById('default_chrome').disabled = false;
	}else{
		document.getElementById('default_chrome').checked = false;
		document.getElementById('default_chrome').disabled = true;
	}
	}catch(e){}
}

	 
/* 
|	
|	RAINSTALLER 
|	Install page Properties and Methods
|
*/
RAINSTALLER.install = {};
RAINSTALLER.install.trackEvents = true;

RAINSTALLER.install.showSlide = function ( numSlideOut, numSlideIn ) {
	try {
		var domIdOut = "slideshow" + numSlideOut;
		var domIdIn = "slideshow" + numSlideIn;
		var outArray = [ domIdOut + "a", domIdOut + "b"];
		var inArray = [ domIdIn, domIdIn + "a", domIdIn + "b" ];
			
		dojo.lfx.html.fadeOut( outArray, 
								800, 
								0, 
								function() { 
									dojo.lfx.html.fadeIn( inArray, 800).play(); }
								).play();
	}
	catch(e){
		//alert(e);
	}	
};

RAINSTALLER.install.playSlideshow = function () {
	try {
		if( "clientOnly" == RAINSTALLER.install.slideShowType  ) {
			dojo.lfx.html.fadeIn( ["slideshow3","slideshow3a","slideshow3b"], 100).play();
		} else {
			dojo.lfx.html.fadeIn( ["slideshow1","slideshow1a","slideshow1b"], 100).play();
		}
		setInterval( RAINSTALLER.install.loopSlideshow, 1000 );
	}
	catch(e){
		//alert(e);
	}			
};

RAINSTALLER.install.loopSlideshow = function () {
	window.secondsElapsed = window.secondsElapsed ? window.secondsElapsed + 1 : 1;
	if( "clientOnly" == RAINSTALLER.install.slideShowType  ) {
		switch(Number(window.secondsElapsed)) {
			case 2:
			  	RAINSTALLER.install.showSlide(3,4);
			  	break;
			case 12:
			  	RAINSTALLER.install.showSlide(4,3);
			  	break;
			case 21:
			  	RAINSTALLER.install.showSlide(3,4);
			  	break;
			case 28:
			  	RAINSTALLER.install.showSlide(4,3);
			  	break;
			default:
			  	if( window.secondsElapsed >= 28 ) window.secondsElapsed = 3;
			  	return;
		}
	} else {
		switch(Number(window.secondsElapsed)) {
			case 2:
			  	RAINSTALLER.install.showSlide(1,2);
			  	break;
			case 12:
			  	RAINSTALLER.install.showSlide(2,3);
			  	break;
			case 21:
			  	RAINSTALLER.install.showSlide(3,4);
			  	break;
			case 28:
			  	RAINSTALLER.install.showSlide(4,2);
			  	break;
			default:
			  	if( window.secondsElapsed >= 28 ) window.secondsElapsed = 3;
			  	return;
		}
	}
};

RAINSTALLER.install.progressbar = { maxSteps:365, barWidth:365 };

RAINSTALLER.install.IncProgressBar = function ( steps ) { 
	try {
		if ( Number( steps ) > RAINSTALLER.install.progressbar.maxSteps ) steps = RAINSTALLER.install.progressbar.maxSteps;
		var barWidth = ( Number( steps )/RAINSTALLER.install.progressbar.maxSteps ) * RAINSTALLER.install.progressbar.barWidth;
		document.getElementById("progressBarBody").style.width = barWidth;
		//return true;
	}
	catch(e) {
		//return false;
	}
};

RAINSTALLER.install.InitializeProgressInfo = function ( str ) {
	try {
		var arrParams = str.split("|");
		RAINSTALLER.install.SetProgressGranularity( RAINSTALLER.getValueFromPair(arrParams[0]) );
		//document.getElementById("totalFiles").innerHTML = RAINSTALLER.getValueFromPair(arrParams[1]);
		RAINSTALLER.install.totalDownloadSize = RAINSTALLER.getValueFromPair(arrParams[2]);
		document.getElementById("totalDownloadSize").innerHTML = RAINSTALLER.install.totalDownloadSize;

	}
	catch(e) {
		//alert(e);
	}
};

RAINSTALLER.install.UpdateProgressInfo = function ( str ) {
	try {
		var arrParams = str.split("|");
		
		try {
			RAINSTALLER.install.SetProgressGranularity( RAINSTALLER.getValueFromPair(arrParams[4]) );
			//document.getElementById("totalFiles").innerHTML = RAINSTALLER.getValueFromPair(arrParams[5]);
			//RAINSTALLER.install.totalDownloadSize = RAINSTALLER.getValueFromPair(arrParams[6]);
			document.getElementById("totalDownloadSize").innerHTML = RAINSTALLER.install.totalDownloadSize;
		}
		catch(e) {
			//alert(e);
		}

		document.getElementById("installerPhase").innerHTML = RAINSTALLER.getValueFromPair(arrParams[0]);
		RAINSTALLER.install.IncProgressBar(RAINSTALLER.getValueFromPair(arrParams[1]));
		//document.getElementById("currentFile").innerHTML = RAINSTALLER.getValueFromPair(arrParams[2]);
		//document.getElementById("downloadedMegs").innerHTML = RAINSTALLER.getValueFromPair(arrParams[3]);
		//RAINSTALLER.install.totalDownloadPercent = ( Number(RAINSTALLER.getValueFromPair(arrParams[3]))/Number(RAINSTALLER.install.totalDownloadSize) ) * 100;
		//document.getElementById("percentDownloaded").innerHTML = (RAINSTALLER.install.totalDownloadPercent).toFixed(1);
	}
	catch(e) {
		//alert(e);  
	}
};

RAINSTALLER.install.SetProgressGranularity = function ( maxSteps ) { 
	try {
		if ( Number( maxSteps ) > 0 ) {
			RAINSTALLER.install.progressbar.maxSteps = Number( maxSteps );
			//return true;
		}
	}
	catch(e) {
		//return false;
	}
};

RAINSTALLER.install.ProgressToEnd = function () {
	try {
		document.getElementById("progressBarBody").style.width = RAINSTALLER.install.progressbar.barWidth + "px";
		//document.getElementById("currentFile").innerHTML = document.getElementById("totalFiles").innerHTML;
		//document.getElementById("downloadedMegs").innerHTML = RAINSTALLER.install.totalDownloadSize;
		//document.getElementById("percentDownloaded").innerHTML = "100";
		//return true;
	}
	catch(e) {
		//alert(e)
		//return false;
	};
};
									
RAINSTALLER.install.updateProgressMessage = function ( message ) {
	try {
		var elem = document.getElementById("progressMessage");
		RAINSTALLER.clearChildNodes( elem );
		elem.appendChild( document.createTextNode( message ) );
		//return true;
	}
	catch(e) {
		//alert(e);
		//return false;
	}
};									

/* 
|	
|	RAINSTALLER 
|	Install complete page Properties and Methods
|
*/
RAINSTALLER.installComplete = {};
RAINSTALLER.installComplete.trackEvents = true;

RAINSTALLER.installComplete.createGameObject = function ( gameId ) {
	try {
		var oAppCore = new ActiveXObject( "RAComponents.RAAppCore" );
		oAppCore.startUp();
		var oAppState = new ActiveXObject( "RAComponents.RAAppState" );
		var oResourceManager = new ActiveXObject( "RAComponents.RAResourceMgr" );
		var oDataSourceMgr = new ActiveXObject( "RADataStore.RADataSourceMgr" );
		oDataSource = oDataSourceMgr.defaultDataSource;
		var configureMgr = new ActiveXObject( "RAComponents.RAConfigureMgr" );
		var raUserObject = new ActiveXObject( "RAComponents.RAUser" );
		return oDataSource.loadGame( gameId, "download" );
	}
	catch(e) {
		return false;
	}
};

RAINSTALLER.installComplete.initialize = function () {
	try {
		//Track Game download complete event
	/*
		var game = RAINSTALLER.installComplete.createGameObject( window.gameId );
        
		document.getElementById("playButton").onclick = function () { 
			RAINSTALLER.omniture.trackLink( { pageName:'installComplete', eventName:"I:  Button:  Play Now", linkType:'o', linkTrackEvents:[ 'event8' ]} );		
			try {
				var oConfigMgr = new ActiveXObject("RAComponents.RAConfigureMgr");
				var app = oConfigMgr.item("MainApp");
				var path = oConfigMgr.item("InstallPath");
				
				var oProcMgr = new ActiveXObject("StubbyUtil.ProcessMgr");
				oProcMgr.ExecLow( app, "/launchgame " + window.gameId, path );
				
				// exit the installer
				setTimeout( "RAINSTALLER.RACInstallerControl.Exit()", 500 );
			} 
			catch(e) {
				//alert(e);
			}
		};
        
		// determine game status: demoinstall, demoexpired, full version
		if ( game.purchaseStatus ) {
			// full version - show play button
			//document.getElementById("playButton").style.display = "block";
		}
		else {
			// demo
			if ( game.unlimitedPlay ) {
				//unlimited play ui
				document.getElementById("playButton").style.display = "block";
				document.getElementById("youHave").style.display = "block";
				//document.getElementById("purchaseInformation").style.display = "block";
				document.getElementById("minutesRemaining").appendChild( document.createTextNode( "unlimited " ) );
				//document.getElementById("demoType").appendChild( document.createElement("BR") );
				//document.getElementById("demoType").appendChild( document.createTextNode( "Trial Time Remaining" ) );
				//document.getElementById("unlimited").style.display = "block";		
			} else {
				// display appropriate play button
				if ( Number( game.minutesRemaining ) > 0 ) {
					document.getElementById("playButton").style.display = "block";
				}
				else {
					document.getElementById("playButtonDisabled").style.display = "block";
				} 
				document.getElementById("youHave").style.display = "block";
				//document.getElementById("timeRemaining").style.display = "block";
				//document.getElementById("purchaseInformation").style.display = "block";
				document.getElementById("minutesRemaining").appendChild( document.createTextNode( game.minutesRemaining + " minutes " ) );
				document.getElementById("of").style.display = "inline";
				//document.getElementById("demoType").appendChild( document.createTextNode( game.demoMinutes + " - Minute Demo" ) );
				//document.getElementById("timeRemaining").appendChild( RAINSTALLER.installComplete.createProgressBar( game ) );
			}
		}  
	*/		
	}
	catch(e) {
		return false;
	}
};

RAINSTALLER.installComplete.siteLinkAction = function ( url ) {
	try {
		RAINSTALLER.omniture.trackLink( { pageName:'installComplete', eventName:"I:  Link:  Return to RealArcade", linkType:'e', linkTrackEvents:[ 'event8' ]} );		
		var win = window.open(url);
		setTimeout( "RAINSTALLER.RACInstallerControl.ExitWithCode(111)", 500 );
	}
	catch(e) {
		//alert(e);
	}		
};

RAINSTALLER.installComplete.onlinedlprPlayLinkAction = function ( url, productPageUrl ) {
	try {
		if (window.opener != null && !window.opener.closed) {
			var pWindow = window.opener;
			pWindow.location.href = productPageUrl;
		}			
		var webWin = window.open(url,"PlayGame","status=0,toolbar=0,location=0,menubar=0,directories=0,resizable=1,scrollbars=1,width=1020,height=735");
		webWin.focus();
		setTimeout( "RAINSTALLER.RACInstallerControl.ExitWithCode(111)", 500 );
	}
	catch(e) {
		//alert(e);
	}		
};

RAINSTALLER.installComplete.playButtonAction = function () {
	try {
		setTimeout( "RAINSTALLER.RACInstallerControl.Exit()", 500 );
	}
	catch(e) {
		//alert(e);
	}		
};

RAINSTALLER.installComplete.createProgressBar = function ( game ) { 
	// create container div
	var elem = document.createElement("DIV");
	elem.style.position = "absolute";
	elem.style.top = "20px";
	elem.style.left = "10px";
	elem.style.height = "18px";
	elem.style.width = "151px";

	if( 0 == game.purchaseStatus ) {
		var nTimeRemaining = Number( game.minutesRemaining );
		var nTotalDemoTime = Number( game.demoMinutes );
		
		if ( game.unlimitedPlay ) {
			nTimeRemaining = 60;
			nTotalDemoTime = 60;
		}
		
		if ( nTotalDemoTime > 0 ) {
			var nBarWidth = 151 - ( ( nTimeRemaining / nTotalDemoTime ) * 151 );
		}
		else {
			var nBarWidth = 0;
		}

		var bgPos = "-" + nBarWidth + "px 0px";

		elem.style.backgroundImage = "url(" + window.staticFileBase + "images/timeRemainingBar.gif)";
		elem.style.backgroundPosition = bgPos;

		var minutesLeft = nTimeRemaining + " min";

		var progressBar = document.createElement("IMG");
		progressBar.style.width = "151px";
		progressBar.style.height = "18px";
		progressBar.src = window.staticFileBase + "images/timeRemainingBorder.gif"; 
		elem.appendChild( progressBar );
		
		var timeRemMin = document.createElement("SPAN");
			timeRemMin.className = "bold";
			timeRemMin.appendChild( document.createTextNode( "  " + minutesLeft ) );	
	
		var timeRem = document.createElement("DIV");
			timeRem.style.position = "absolute";
			timeRem.style.top = "-16px";
			timeRem.style.left = "0px";
			timeRem.style.width ="151px";
			timeRem.style.textAlign = "center";
			timeRem.style.zIndex = "3";
			timeRem.className = "px10";
			timeRem.appendChild( document.createTextNode( "Time Remaining" ) );
			timeRem.appendChild( timeRemMin );
			elem.appendChild( timeRem );
			
		var zeroMin = document.createElement("DIV");
			zeroMin.style.position = "absolute";
			zeroMin.style.top = "2px";
			zeroMin.style.left = "-12px";
			zeroMin.style.zIndex = "3";
			zeroMin.className = "bold";
			zeroMin.innerHTML = "0";
			elem.appendChild( zeroMin );
		
		var maxMin = document.createElement("DIV");
			maxMin.style.position = "absolute";
			maxMin.style.top = "2px";
			maxMin.style.left = "153px";
			maxMin.style.zIndex = "3";
			maxMin.className = "bold";
			maxMin.innerHTML = nTotalDemoTime;
			elem.appendChild( maxMin );				

		elem.appendChild( zeroMin );
		elem.appendChild( maxMin );
	
	}
	else {
		var filler = document.createElement("DIV");
		filler.style.position = "absolute";
		filler.style.top = "-10px";
		filler.style.left = "15px";
		filler.style.width = "116px";
		filler.style.height = "29px";
		elem.appendChild( filler );
	}
	
	return elem;
};									

/* 
|	
|	RAINSTALLER 
|	Install cancelled page Properties and Methods
|
*/
RAINSTALLER.installCancelled = {};
RAINSTALLER.installCancelled.trackEvents = true;

RAINSTALLER.installCancelled.cancelAction = function () {
	if( window.actionClicked != true ) {
		window.actionClicked = true;
 
		try {
			RAINSTALLER.omniture.trackLink( { pageName:'installCancelled', eventName:"I:  Button:  No Thanks", linkType:'e', linkTrackEvents:[ 'event8' ]} );		
			setTimeout( "RAINSTALLER.RACInstallerControl.Exit()", 500 );
		}
		catch(e){
			//alert(e);
		}
	}
};

RAINSTALLER.installCancelled.acceptAction = function (survey) {
	var surveyLink = "http://www.surveymonkey.com/s.aspx?sm=CNasVmIcaVkIGw6SW_2bJOTA_3d_3d"; 

	if( window.actionClicked != true ) {
		window.actionClicked = true;
 		
		try {
			RAINSTALLER.omniture.trackLink( { pageName:'installCancelled', eventName:"I:  Button:  Take Survey", linkType:'e', linkTrackEvents:[ 'event8' ]} );		
			var surveyWin = window.open(surveyLink);
			setTimeout( "RAINSTALLER.RACInstallerControl.Exit()", 500 );
		}
		catch(e){
			//alert(e);
		}			
	}
};

/* 
|	
|	RAINSTALLER 
|	Migration page Properties and Methods
|
*/
RAINSTALLER.migrationComplete = {};

RAINSTALLER.migrationComplete.trackEvents = true;


RAINSTALLER.migrationComplete.initialize = function () {
	try {
		//Track upgrade complete event
		RAINSTALLER.omniture.trackLink( { pageName:'', eventName:'E: Migration complete', linkType:'o', linkTrackVars:{ eVar17:'' }, linkTrackEvents:[ 'event16' ]} );		
	}
	catch(e) {
		//alert(e);
	}
}

RAINSTALLER.migrationComplete.downloadButtonAction = function(gameID, priceID, urlArguments) {
	try {
		RAINSTALLER.omniture.trackLink( { pageName:'migrationComplete', eventName:"I:  Button:  Migration Complete", linkType:'e', linkTrackEvents:[ 'event8' ]} );			
		var win = window.open( getBuyUrl( gameID, priceID, "download", urlArguments ) );
		//alert(getBuyUrl( gameID, priceID, "download", urlArguments ))
	}
	catch(e) {
		//alert(e);
	}
};

RAINSTALLER.migrationComplete.siteLinkAction = function ( url ) {
	try {
		RAINSTALLER.omniture.trackLink( { pageName:'migrationComplete', eventName:"I:  Link:  Migration Complete", linkType:'e', linkTrackEvents:[ 'event8' ]} );		
		var win = window.open(url);
		setTimeout( "RAINSTALLER.RACInstallerControl.Exit()", 500 );
	}
	catch(e) {
		//alert(e);
	}		
};

/* 
|	
|	RAINSTALLER 
|	Upgrade Complete page Properties and Methods
|
*/
RAINSTALLER.upgradeComplete = {};

RAINSTALLER.upgradeComplete.trackEvents = true;

RAINSTALLER.upgradeComplete.initialize = function () {
	try {
		//Track upgrade complete event
		RAINSTALLER.omniture.trackLink( { pageName:'', eventName:'E: Migration complete', linkType:'o', linkTrackVars:{ eVar17:'' }, linkTrackEvents:[ 'event16' ]} );		

		var game = RAINSTALLER.installComplete.createGameObject( window.gameId );

		document.getElementById("playButton").onclick = function () { 
			RAINSTALLER.omniture.trackLink( { pageName:'upgradeComplete', eventName:"I:  Button:  Play Now", linkType:'o', linkTrackEvents:[ 'event8' ]} );		
			try {
				var oConfigMgr = new ActiveXObject("RAComponents.RAConfigureMgr");
				var app = oConfigMgr.item("MainApp");
				var path = oConfigMgr.item("InstallPath");
				
				var oProcMgr = new ActiveXObject("StubbyUtil.ProcessMgr");
				oProcMgr.ExecLow( app, "/launchgame " + window.gameId, path );
				
				// exit the installer
				setTimeout( "RAINSTALLER.RACInstallerControl.Exit()", 500 );
			} 
			catch(e) {
				//alert(e);
			}
		};

		// determine game status: demoinstall, demoexpired, full version
		if ( game.purchaseStatus ) {
			// full version - show play button
			document.getElementById("playButton").style.display = "block";
		}
		else {
			// demo
			if ( game.unlimitedPlay ) {
				//unlimited play ui
				document.getElementById("playButton").style.display = "block";
				document.getElementById("demoType").appendChild( document.createElement("BR") );
				document.getElementById("demoType").appendChild( document.createTextNode( "Trial Time Remaining" ) );
				document.getElementById("unlimited").style.display = "block";		
			} else {
				// display appropriate play button
				if ( Number( game.minutesRemaining ) > 0 ) {
					document.getElementById("playButton").style.display = "block";
				}
				else {
					document.getElementById("playButtonDisabled").style.display = "block";
				}
				document.getElementById("timeRemaining").style.display = "block";
				document.getElementById("demoType").appendChild( document.createTextNode( game.demoMinutes + " - Minute Demo" ) );
				document.getElementById("timeRemaining").appendChild( RAINSTALLER.installComplete.createProgressBar( game ) );
			}
		}	
	}
	catch(e) {
		return false;
	}
}
RAINSTALLER.upgradeComplete.downloadButtonAction = function( url ) {
	try {
		RAINSTALLER.omniture.trackLink( { pageName:'upgradeComplete', eventName:"I:  Button:  Migration Complete", linkType:'e', linkTrackEvents:[ 'event8' ]} );			
		var win = window.open( url );
		setTimeout( "RAINSTALLER.RACInstallerControl.Exit()", 500 );
	}
	catch(e) {
		//alert(e);
	}
};

RAINSTALLER.upgradeComplete.siteLinkAction = function ( url ) {
	try {
		RAINSTALLER.omniture.trackLink( { pageName:'upgradeComplete', eventName:"I:  Link:  Migration Complete", linkType:'e', linkTrackEvents:[ 'event8' ]} );		
		var win = window.open(url);
		setTimeout( "RAINSTALLER.RACInstallerControl.Exit()", 500 );
	}
	catch(e) {
		//alert(e);
	}		
};

/* 
|	
|	RAINSTALLER 
|	Download Queue Properties and Methods
|
*/
RAINSTALLER.downloadQueue = {};

RAINSTALLER.downloadQueue.trackEvents = true;

RAINSTALLER.downloadQueue.completedDownloads = new Array();

RAINSTALLER.downloadQueue.AddCell = function ( gameInfo ) {
	try {
		var templateId = "cellTemplate";
		var parentNodeId = "dlQueue";
		var arrParams = gameInfo.split("|");
		var gameid = arrParams[0];
		var gameName = arrParams[1];
		
		var dupe = document.getElementById(templateId).cloneNode(true);
		var divs = RAINSTALLER.getChildElementsByTagName( dupe, "DIV");
		dupe.id = gameid;

		dupe.getElementsByTagName("IMG")[0].src = RAINSTALLER.getGameImageTinySquare(gameid);
		divs[0].appendChild( document.createTextNode( gameName ) );
//		divs[1].appendChild( document.createTextNode( "Genre" ) );
		divs[6].onclick = function() {RAINSTALLER.downloadQueue.Cancel_Remove(gameid)};
		divs[7].onclick = function() {RAINSTALLER.downloadQueue.Clear(gameid)};
		divs[8].onclick = function() {RAINSTALLER.downloadQueue.Pause(gameid)};
		divs[9].onclick = function() {RAINSTALLER.downloadQueue.Resume(gameid)};

		divs[3].style.display = "block";
		divs[6].style.display = "block";
		
		dupe.style.display = "block";
		document.getElementById(parentNodeId).appendChild(dupe);
		
		//dupe.getElementsByTagName("IMG")[0].id = "tt" + gameid;
		//attachGameToolTip( "tt" + gameid, gameid, "download", 200, 15, 10 );
	}
	catch(e) {
		//alert(e)
	}		
}

RAINSTALLER.downloadQueue.Active = function ( gameid ) {
	try {
		// set the size of the progress bar
		RAINSTALLER.install.progressbar.barWidth = 217;
		RAINSTALLER.install.progressbar.maxSteps = 217;
		document.getElementById("progressBarBody").style.width = "0px";
		
		var node = document.getElementById(gameid);	
		var divs = RAINSTALLER.getChildElementsByTagName( node, "DIV");
		divs[2].style.display = "none";
		divs[3].style.display = "none";
		divs[5].style.display = "none";
		divs[7].style.display = "none";		
		divs[4].appendChild( document.getElementById("downloadQueueProgressBar") );
			document.getElementById("downloadQueueProgressBar").style.display = "block";
		divs[6].className = "cancelTextLow";
		divs[6].style.display = "block";
		divs[8].style.display = "block";
	}
	catch(e) {
		//alert(e);
	}
}

RAINSTALLER.downloadQueue.Complete = function ( gameid ) {
	try {
		var node = document.getElementById(gameid);
		var divs = RAINSTALLER.getChildElementsByTagName( node, "DIV");
		divs[2].style.display = "none";
		divs[3].style.display = "none";
		divs[4].style.display = "none"
		divs[6].style.display = "none";
		divs[5].style.display = "block";
		divs[7].style.display = "block";
		divs[8].style.display = "none";
		divs[9].style.display = "none";

		//make play button
		var game = RAINSTALLER.installComplete.createGameObject( gameid );
		node.getElementsByTagName("IMG")[2].gameid = gameid;
		node.getElementsByTagName("IMG")[2].onclick = function () { 
			try {
				RAINSTALLER.omniture.trackLink( { pageName:'downloadQueue', eventName:"Installer: Download Queue: Play Button", linkType:'o', linkTrackEvents:[ 'event8' ]} );
				var oConfigMgr = new ActiveXObject("RAComponents.RAConfigureMgr");
				var app = oConfigMgr.item("MainApp");
				var path = oConfigMgr.item("InstallPath");
				
				var oProcMgr = new ActiveXObject("StubbyUtil.ProcessMgr");
				oProcMgr.ExecLow( app, "/launchgame " + this.gameid, path );
			} 
			catch(e) {
				//alert(e);
			}
		};	
		node.getElementsByTagName("IMG")[2].style.display = "block";
	
		//make buy button
		node.getElementsByTagName("IMG")[3].gameid = gameid;
		node.getElementsByTagName("IMG")[3].priceId = game.priceId;
		node.getElementsByTagName("IMG")[3].gameType = game.gameType;
		node.getElementsByTagName("IMG")[3].onclick = function () { 
			try {
				RAINSTALLER.omniture.trackLink( { pageName:'downloadQueue', eventName:"Installer: Download Queue: Buy Button", linkType:'o', linkTrackEvents:[ 'event8' ]} );		
				//alert(getBuyUrl(this.gameid, this.priceId, this.gameType))
				window.open( getBuyUrl(this.gameid, this.priceId, this.gameType) );
			} 
			catch(e) {
				//alert(e);
			}
		};	
		node.getElementsByTagName("IMG")[3].style.display = "block";	
		RAINSTALLER.downloadQueue.completedDownloads.push(gameid);
		
		//Track Game download complete event
		RAINSTALLER.omniture.trackLink( { pageName:'', eventName:'E: Game download complete', linkType:'o', linkTrackVars:{ eVar17:'' }, linkTrackEvents:[ 'event4' ], products:gameid} );		
	
	}
	catch(e) {
		//alert(e);
	}		
}

RAINSTALLER.downloadQueue.Cancel_Remove = function ( gameid ) {
	try {
		RAINSTALLER.RACInstallerControl.QueueRemove( gameid );
		var node = document.getElementById(gameid);
		node.parentNode.removeChild(node);
	}
	catch(e) {
		//alert(e);
	}
}

RAINSTALLER.downloadQueue.Clear = function ( gameid ) {
	try {
		var node = document.getElementById(gameid);
		node.parentNode.removeChild(node);
	}
	catch(e) {
		//alert(e);
	}
}

RAINSTALLER.downloadQueue.clearCompleted = function () {
	try {
		for(i=0; i<RAINSTALLER.downloadQueue.completedDownloads.length; i++) {
			RAINSTALLER.downloadQueue.Clear(RAINSTALLER.downloadQueue.completedDownloads[i]);
		}
	}
	catch(e) {
		//alert(e);
	}
}

RAINSTALLER.downloadQueue.Pause = function ( gameid ) {
	try {
		var node = document.getElementById(gameid);
		var divs = RAINSTALLER.getChildElementsByTagName( node, "DIV");
		divs[8].style.display = "none";
		divs[9].style.display = "block";
		RAINSTALLER.RACInstallerControl.queuePause(gameid);
	}
	catch(e) {
		//alert(e);
	}
}

RAINSTALLER.downloadQueue.Resume = function ( gameid ) {
	try {
		var node = document.getElementById(gameid);
		var divs = RAINSTALLER.getChildElementsByTagName( node, "DIV");
		divs[9].style.display = "none";
		divs[8].style.display = "block";
		RAINSTALLER.RACInstallerControl.queuePause(gameid);
	}
	catch(e) {
		//alert(e);
	}
}

RAINSTALLER.downloadQueue.jumpToNext = function ( node ) {
	try {
		var topNode = node.parentNode.parentNode;
		topNode.insertBefore(node.parentNode, topNode.firstChild.nextSibling);
		RAINSTALLER.RACInstallerControl.queueTop(node.parentNode.id);
	}
	catch(e) {
		//alert(e);
	}
}

RAINSTALLER.downloadQueue.menuAction = function ( elem ) {
	try {
		if(elem.checked) {
			RAINSTALLER.RACInstallerControl.Message("KeepMinimized|true");
		}
		else {
			RAINSTALLER.RACInstallerControl.Message("KeepMinimized|false");
		}
	}
	catch(e) {
		//alert(e);
	}
}

RAINSTALLER.downloadQueue.showTip = function ( elem ) {
	try {
		var kids = RAINSTALLER.getChildElementsByTagName( elem, "SPAN");
		kids[0].style.display = "inline";
	}
	catch(e) {
		alert(e);
	}
}

RAINSTALLER.downloadQueue.hideTip = function ( elem ) {
	try {
		var kids = RAINSTALLER.getChildElementsByTagName( elem, "SPAN");
		kids[0].style.display = "none";
	}
	catch(e) {
		//alert(e);
	}
}
YAHOO.util.Event.onDOMReady(RAINSTALLER.callLoadComplete);


