function notImplemented( functionBody )
{
    var bodyString = new String( functionBody );
    alert( bodyString.substring( 0, bodyString.indexOf( ")" ) + 1 ) + " is not implemented!" );
}

// Function prototypes for thirdparty users
function initGameScript( tThirdPartySource, tLanguage, tCountry, tSource, racTypeIN, distCodeIN )  { notImplemented( arguments.callee ); }
function getDownloadUrl( gameID, gameType, urlArguments )                   { notImplemented( arguments.callee ); }
function getBuyUrl( gameID, priceID, gameType, urlArguments )               { notImplemented( arguments.callee ); }
function getBuyGpUrl( gpType, initTerm, urlArguments  )                     { notImplemented( arguments.callee ); }
function getActivateGpUrl( initTerm, urlArguments )                         { notImplemented( arguments.callee ); }
function getUserReviewUrl( gameID, gameType, access )                       { notImplemented( arguments.callee ); }
function getScreenShotsUrl( gameID, gameType )                              { notImplemented( arguments.callee ); }
function getGameMessageBoardUrl( gameID, gameType, lang )                   { notImplemented( arguments.callee ); }
function getMessageBoardUrl( boardId )                                      { notImplemented( arguments.callee ); }
function getGameTellAFriendUrl( gameID, gameType )                          { notImplemented( arguments.callee ); }
function getTellAFriendUrl( tellAFriendId )                                 { notImplemented( arguments.callee ); }
function getLaunchWebGameUrl( gameID, webPlayUrl, urlArguments )            { notImplemented( arguments.callee ); }
function getGamePageUrl( gameID, gameType )                                 { notImplemented( arguments.callee ); }
function getGenrePageUrl( genreId )                                         { notImplemented( arguments.callee ); }
function getFaqPageUrl( faqId )                                             { notImplemented( arguments.callee ); }
function getPageUrl( pType )                                                { notImplemented( arguments.callee ); }
function getPromoPage( gameID, promoType )                                  { notImplemented( arguments.callee ); }
function getCouponPage( gameID, ecqs )                                      { notImplemented( arguments.callee ); }

// Internal functions and variables for Url generating functions.
function RealArcade()
{
    this.GENERATE_URL_ERROR = "error in generating url";
    this.DEFAULT_PRICE_ID = "4";
    this.DEFAULT_GAME_TYPE = "download";
    this.DEFAULT_GP_TYPE = "full";
    this.VALIDATION_ACTION_ERROR = "action=error";
    this.BASE_URL = "http://switchboard.real.com/arcade/feeds.html";
    this.DOWNLOAD_BASE_URL = "http://switchboard.real.com/arcade/feeds.html";
    this.TPS = "tps";
    this.LANG = "lang";
    this.COUNTRY = "country";
    this.PARTNER = "partner";
    this.GAMEID = "gameid";
    this.CLIENT = "client";
    this.RACTYPE = "ractype";
    this.RACVERSION = "racversion";
    this.INSTALLERVERSION = "installerversion";
    this.GAMETYPE = "gametype";
    this.DOWNLOADTYPE = "dltype";
    this.RACINSTALLED = "arcadeinstalled";
	this.RACDISTCODE = "distcode";
    this.GAMEPASSTYPE = "gptype";
    this.ACCESS = "access";
    this.BOARDID = "boardid";
    this.TAFID = "tafid";
    this.GENREID = "genreid";
    this.GENRETYPE = "genretype";
    this.PAGETYPE = "ptype";
    this.PROMOTYPE = "promotype";
    this.FAQTYPE = "faqtype";
    this.FAQID = "faqid";
    this.COUPON = "ecqs";
    this.SOURCECONTENT = "sourcecontent";
    this.INIT_TERM = "init_term";
    this.SRC = "src";
    this.RSRC = "rsrc";
    this.LSRC = "lsrc";
    this.SPARAM = "sparam";
    this.ISRC = "isrc";
    this.ILSRC = "ilsrc";
    this.IRSRC = "irsrc";
    this.GUID = "guid";
    this.SUBSCRIPTION = "subscription";
    this.ACTION = "action";
    this.PRICEID = "priceid";
    this.SHOCKWAVE = "shockwave";
    this.JAVA = "java";
    this.USECLIENT = "false";
    this.DOWNLOAD_ACTION		    = "download";
    this.BUYURL_ACTION			    = "buy";
    this.BUYGP_ACTION			    = "buy_gp";
    this.ACTIVATEGP_ACTION		    = "activate_gp";
    this.USERREVIEW_ACTION		    = "user_review";
    this.SCREENSHOTS_ACTION		    = "screen_shots";
    this.MESSAGEBOARD_ACTION	    = "message_board";
    this.TELLAFRIEND_ACTION		    = "tell_a_friend";
    this.LAUNCHWEBGAME_ACTION	    = "launch_web_game";
    this.PAGE_ACTION			    = "page";
    this.COMMON_ACTION			    = "common";
    this.DEFAULT_GAME_PAGE_TYPE     = "game";
    this.DEFAULT_GENRE_PAGE_TYPE    = "gpage";
    this.DEFAULT_FAQ_PAGE_TYPE      = "topfaqs";
    this.DEFAULT_PROMO_PAGE_TYPE    = "0";
    this.PROMO_PAGE_TYPE            = "promo";
    this.DOWNLOADTYPE_RDX           = "rdxbundle";
    this.DOWNLOADTYPE_BUNDLE        = "bundle";
    this.DOWNLOADTYPE_GAME          = "game";
    this.WEB_PLAY_URL               = "web_play_url";
    this.COUPONPATH_ACTION          = "validate_coupon";
    this.ACTION_RANGE = [ this.DOWNLOAD_ACTION,
                          this.BUYURL_ACTION,
                          this.BUYGP_ACTION,
                          this.ACTIVATEGP_ACTION,
					      this.USERREVIEW_ACTION,
					      this.SCREENSHOTS_ACTION,
					      this.MESSAGEBOARD_ACTION,
					      this.TELLAFRIEND_ACTION,
					      this.LAUNCHWEBGAME_ACTION,
					      this.PAGE_ACTION,
					      this.PROMO_ACTION,
					      this.COMMON_ACTION,
					      this.COUPONPATH_ACTION ];
	this.usePartnerPages = "1";
    this.baseUrl = "";
    this.thirdPartySource = "";
    this.language = "";
    this.country = "";
    this.client = "";
    this.source = "";
    this.rsrc = "";
    this.lsrc = "";
    this.sparam = "";
    this.isrc = "";
    this.irsrc = "";
    this.ilsrc = "";
    this.guid = "";
    this.subscription = "";
    this.ractype = "oldclient";
    this.racversion = "";
    this.installerVersion = "";
    this.racInstalled = "";
    this.racDistCode = "";
    this.useAlternateURL = false;
    this.shockwaveInstalled = "";
    this.javaEnabled = "";
	this.debugInfo = "";

    this.allValidMappings = [ {name:this.ACTION,
						  range:this.ACTION_RANGE,
						  validateFunction:validateEnumeration},

						 {name:this.TPS,
						  range:null,
						  validateFunction:validateNotNull},

						 {name:this.LANG,
						  range:null,
						  validateFunction:validateNotNull},

						 {name:this.COUNTRY,
						  range:null,
						  validateFunction:validateNotNull},

						 {name:this.GAMEID,
						  range:null,
						  validateFunction:validateGameID},

						 {name:this.CLIENT,
						  range:["web", "arcade", "player"],
						  validateFunction:validateEnumeration},

                         {name:this.RACTYPE,
                          range:["oldclient", "clientless", "fullclient" ],
                          validateFunction:validateEnumeration},

                         {name:this.RACVERSION,
                          range:null,
						  validateFunction:validateNotNull},
                          
                         {name:this.INSTALLERVERSION,
                          range:null,
						  validateFunction:validateNotNull},
						  
                         {name:this.GAMETYPE,
                          range:["download", "palm", "web"],
                          validateFunction:validateEnumeration},

                         {name:this.DOWNLOADTYPE,
                          range:[this.DOWNLOADTYPE_RDX, this.DOWNLOADTYPE_BUNDLE, this.DOWNLOADTYPE_GAME],
                          validateFunction:validateEnumeration},

                         {name:this.RACINSTALLED,
                          range:[ 1, 0 ],
                          validateFunction:validateEnumeration},

                         {name:this.GAMEPASSTYPE,
                          range:["full", "trial"],
                          validateFunction:validateEnumeration},

                         {name:this.ACCESS,
                          range:["read", "write"],
                          validateFunction:validateEnumeration},

                         {name:this.BOARDID,
                          range:["index", "rac", "general", "tips", "news",
                                 "comments", "de_games", "de_rac"],
                          validateFunction:validateEnumeration},

                         {name:this.TAFID,
                          range:["rac", "gamepass"],
                          validateFunction:validateEnumeration},

                         {name:this.PAGETYPE,
                          range:["game", "gpage", "topfaqs", "index", "featured", "allgames", "helpdesk",
                                 "eula", "ppolicy", "feedback", "gamepass", "custserv", "myacct", "gupdates",
                                 "sysreqs", "ractour", "realarcade", "gptrial", "gpfull", "promo"],
                          validateFunction:validateEnumeration},

                         {name:this.FAQID,
                          range:null,
                          validateFunction:validateNotNull},

						  {name:this.INIT_TERM,
						   range:null,
						   validateFunction:validateNotNull},

						  {name:this.SRC,
						   range:null,
						   validateFunction:validateNotNull},
						   
						  {name:this.RSRC,
							range:null,
							validateFunction:validateNotNull},
							   
						  {name:this.LSRC,
							range:null,
							validateFunction:validateNotNull},
							
						  {name:this.SPARAM,
							range:null,
							validateFunction:validateNotNull},
							
						  {name:this.ISRC,
		  				    range:null,
							validateFunction:validateNotNull},
								   
					 	  {name:this.IRSRC,
							range:null,
							validateFunction:validateNotNull},
								   
						  {name:this.ILSRC,
							range:null,
							validateFunction:validateNotNull},							

						  {name:this.GUID,
							range:null,
							validateFunction:validateNotNull},
									   
						  {name:this.SUBSCRIPTION,
							range:null,
							validateFunction:validateNotNull},							

						  {name:this.PRICEID,
						   range:["7", "6", "5", "4", "3", "2", "1", "0"],
						   validateFunction:validateEnumeration},

						  {name:this.WEB_PLAY_URL,
						   range:[1, 2, 3, 4, 5],
						   validateFunction:validateEnumeration}

					   ];

}

var realArcade = new RealArcade();

function dbgout( str ) 
{
	realArcade.debugInfo += str + "<br>";
}

function output( str ) {
	var oConsole = window.open( '','cnsl','width=640,height=400,resizable=yes,scrollbars=yes,left=20,top=20' );
	oConsole.document.open( 'text/html' );
	oConsole.document.write( '<html><head><style>.error {color:red;} B {font-size:14px;}</style></head><body style="font-family:sans-serif;font-size:12px">' + str + '</body></html>' );
	oConsole.document.close();
	//var node = document.createElement("DIV");
	//node.appendChild( document.createTextNode( realArcade.debugInfo ) );
	//document.getElementsByTagName("BODY").item(0).appendChild(node);
}

function validateGameID( gameID )
{
	return (gameID.length > 0);// && (gameID.match("\\W") == null);
}

function validateNumber( num )
{
	if( typeof( num ) == "string" )
	{
		return (num.search( "^\\d+$" ) != -1);
	}
	return ( typeof( num ) == "number" );
}

function validateNotNull( val )
{
	return (val != null);
}

function validateEnumeration( item, list )
{
    for( var i = 0; i < list.length; i++ )
    {
        if( list[i] == item )
        {
			return true;
        }
    }
    return false;
}

function validateUrl( url )
{
	var regex = "(((https?)|(ftp)):\\/\\/([\\-\\w]+\\.)+\\w{2,3}(\\/[%\\-\\w]+(\\.\\w{2,})?)*(([\\w\\-\\.\\?\\\\/+@&amp;#;`~=%!]*)(\\.\\w{2,})?)*\\/?)";
	return ( url.search(regex) == 0 && url.search("\\s") == -1);
}

function validateArgument( argName, argValue )
{
	var validateMap = realArcade.allValidMappings[ argName ];
	if( validateMap != null)
	{
		var isRangeValidation = ( validateMap.range != null && validateMap.validateFunction != null );
		var isValueValidation = ( validateMap.validateFunction != null );

		if( isRangeValidation  )
		{
			return validateMap.validateFunction( argValue, validateMap.range );
		}
		else if( isValueValidation )
		{
			return validateMap.validateFunction( argValue );
		}
	}
	return true;
}

function getGhInstallerVersion( ctrl )
{
	dbgout( "<br /><b>Determining GH Installer Version</b>" );

	var undefined;
	if ( isBrowerIE5OrAbove())
	{
		if ( undefined == ctrl )
		{
			dbgout( " -- GH Installer Control undefined" );
			return undefined;
		}

		try
		{
			if ( isBrowerIE5OrAbove() ) 
			{
				dbgout( " -- IE GH Installer Version = " + ctrl.GameInstallerVersion() );
				return ctrl.GameInstallerVersion();
			} 
			else 
			{
				dbgout( "<span class=error>This browser is not supported in the GH urlGenerator, yet</span>" );
				return undefined;
			}
		}
		catch(e)
		{
			dbgout( "<span class=error>Error determining Installer Version: " + e + "</span>" );
			return undefined;
		}
	}
	else
	{
		dbgout( "<span class=error>This browser is not supported in urlGenerator</span>" );
		return undefined;
	}
}


function createGameHouseVersionControl()
{
	dbgout( "<br><b>Creating gh ActiveX Control/Plug-in</b>" );
	var control;
	try
	{
		if ( isBrowerIE5OrAbove() ) {
			dbgout( " -- Creating GH ActiveX Control in IE" );
			control = new ActiveXObject('CheckInst.InstallerState');
			dbgout( " -- GH ActiveX Control in IE created" );
		} 

	}
	catch(e)
	{
		dbgout( "<span class=error>Exception creating GH VersionControl: " + e + "</span>" );
	}

	return control;
}

function createMozillaPlugin( name, mime )
{
	dbgout( "<b> -- Begin createMozillaPlugin() " + name + " - " + mime + "</b>" );
	try
	{
		// create embed tag for plugin
		dbgout( " -- create OBJECT node" );
		var objectNode = document.createElement('OBJECT');

		dbgout( " -- attach plugin to Head element" );
		var head = document.getElementsByTagName("HEAD").item(0);

		dbgout( " -- set OBJECT node attributes" );
		objectNode.setAttribute( 'name', name );
		objectNode.setAttribute( 'id', name );
		objectNode.setAttribute('width',0);
		objectNode.setAttribute('height',0);
		objectNode.setAttribute( 'type', mime );

		head.appendChild(objectNode);

		// set reference to plugin
		dbgout( " -- set a reference to the plugin" );
		var npracplug = document.getElementById( name );

		// force the browser to 'parse' the plugin
		// this is to make firefox load the object
		dbgout( " -- force the browser to load the plugin" );
		var str='';
		for (o in npracplug)
		{
			str = npracplug[o];
		}

		dbgout( "Done createMozillaPlugin() " + name + " - " + mime );
		return npracplug;
	}
	catch(e)
	{
		dbgout( "<span class=error>Exception creating Mozilla plugin: " + e + "</span>" );
	}
}

function isShockwaveInstalled()
{
    if (window.ActiveXObject)
    {
        try
        {
            oShock= new ActiveXObject('SWCtl.SWCtl');

            if (oShock)
            {
                return 1;
            }
        }
        catch(e) 
		{
			dbgout( "Shockwave not detected in IE");
		}
    }
    return 0;
}

function isJavaEnabled()
{
    if ( navigator.javaEnabled() )
    {
        return 1;
    }

    return 0;
}

function isPageLoadedByRealPlayer()
{
    var agent = navigator.userAgent.toLowerCase();

    return agent.match( "\\(r1" ) != null;
}

function createArcadeV2VersionControl()
{
    dbgout( "<br><b>Creating v2 ActiveX Control/Plug-in</b>" );
    var control;
    try
    {
        if ( isBrowerIE5OrAbove() ) {
            dbgout( " -- Creating v2 ActiveX Control in IE" );
            control = new ActiveXObject('RAComponents.RAConfigureMgr');
            dbgout( " -- v2 ActiveX Control in IE created" );
        } 
        else 
        {
            if( isFirefox() || isGoogle() || isNetscape() )
            {   
 
                dbgout( " -- Creating v2 ActiveX Control in FF/Chrome" );
                if ( "undefined" !=  typeof GeckoActiveXObject ) {
                    dbgout( " -- -- ...using GeckoActiveXObject" );
                    control = new GeckoActiveXObject('RAComponents.RAConfigureMgr');
                } else {
                    dbgout( " -- -- ...using NPAPI Plugin" );
                    control = new ActiveXObject('RAComponents.RAConfigureMgr');
                }
                dbgout( " -- v2 ActiveX Control in FF/Chrome created" );
            }
        }
    }
    catch(e)
    {
        dbgout( "<span class=error>Exception creating arcade20VersionControl: " + e + "</span>" );
    }

    return control;
}

function detectV2Rac( ctrl ) 
{
    dbgout( "<br /><b>Detecting V2 Rac</b>" );

    var undefined;
    if ( undefined != ctrl || (navigator.mimeTypes["application/realarcade-npapi-scriptable-plugin"]) ) 
    {
        dbgout( " -- v2 Rac control exists" );
        return 1;
    } 
    else
    {
        dbgout( " -- v2 Rac not detected" );
        return 0;
    }
    return 0;
}

function isBrowerIE5OrAbove()
{
    var agent = navigator.userAgent.toLowerCase();
    var isIE = ((agent.indexOf("msie") != -1) && (agent.indexOf("opera") == -1));

    return (isIE && parseInt(navigator.appVersion) >= 4 && agent.indexOf("msie 4")== -1 );
}

function isNetscape()
{
	// this category captures non-Firefox Gecko-based browsers
    var agent = navigator.userAgent.toLowerCase();
    return ( !isFirefox() && ( ( agent.indexOf("netscape") != -1 ) || ( agent.indexOf("gecko") != -1 ) ) && ( navigator.userAgent.charAt(8) ) >= ('3') );
}

function isFirefox()
{
    var agent = navigator.userAgent.toLowerCase();
    return ( ( agent.indexOf("firefox") != -1 ) );
}

function isGoogle()
{
    var agent = navigator.userAgent.toLowerCase();
    return ( agent.indexOf("chrome") != -1 );
}

function initGameScript( tThirdPartySource, tLanguage, tCountry, tSource, racTypeIN, distCodeIN )
{
	var undefined;

	dbgout( "<br /><b> -- Beginning initGameScript( " +  
			tThirdPartySource + ", " + 
			tLanguage + ", " + 
			tCountry + ", " + 
			tSource + ", " + 
			racTypeIN + ", " + 
			distCodeIN + " ) -- </b>" )

	dbgout( "baseUrl = " + realArcade.BASE_URL );
    realArcade.baseUrl = realArcade.BASE_URL;
    dbgout( "download baseUrl = " + realArcade.DOWNLOAD_BASE_URL );
    realArcade.downloadBaseUrl = this.DOWNLOAD_BASE_URL;
    realArcade.thirdPartySource = tThirdPartySource;
    realArcade.language = tLanguage;
    realArcade.country = tCountry;
    realArcade.ractype = racTypeIN;

    //detect realone player and change client to PLAYER if we have player installed/running
    if ( isPageLoadedByRealPlayer() )
    {
        realArcade.client = "player";
    }
    else
    {
        realArcade.client = "web";
    }

    realArcade.source = tSource;

	
	//perform installer detection
	var ghVersionControl = createGameHouseVersionControl();
	var ghInstallerVersion = getGhInstallerVersion( ghVersionControl );

	realArcade.installerVersion = ghInstallerVersion ? ghInstallerVersion : "";
    
    realArcade.shockwaveInstalled = isShockwaveInstalled();
    realArcade.javaEnabled = isJavaEnabled();
	
    for (var i = 0; i < realArcade.allValidMappings.length; ++ i )
    {
		realArcade.allValidMappings[ realArcade.allValidMappings[i].name ] = realArcade.allValidMappings[i];
    }

    //v2 RAC detect for My RealArcade Games Page 
    dbgout( "<b> -- createArcadeV2VersionControl -- </b>" );
    var v2VersionControl = createArcadeV2VersionControl();
    var v2RacInstalled = detectV2Rac( v2VersionControl );

    if( "fullclient" == racTypeIN  ) {
        // if checking for full client, check for v2 first  
        realArcade.racInstalled = v2RacInstalled ? 1 : 0 ;
    }

	dbgout( "<b> -- Exiting initGameScript() -- </b>" );



}

function generateQueryString()
{
    var returnString = "";
    var undefined;

    if( arguments.length > 0 && (arguments.length % 2) == 0 )
    {
        if( ! validateArgument( arguments[0], arguments[1] ) )
        {
            alert( "1) failed in validating " + arguments[0] + ", " + arguments[1] );
            return realArcade.VALIDATION_ACTION_ERROR;
        }
        returnString = arguments[0] + "=" + arguments[1];

        for( var i = 2; i < arguments.length; i +=2 )
        {
            var nameIndex = i;
            var valueIndex = i+1;

            if ( arguments[valueIndex] != undefined )
            {
                if(! validateArgument( arguments[nameIndex], arguments[valueIndex] ) )
                {
                    alert( "2) failed in validating " + arguments[nameIndex] + ", " + arguments[valueIndex] );
      			    return realArcade.VALIDATION_ACTION_ERROR;
                }

                returnString += "&" + arguments[nameIndex] + "=" + arguments[valueIndex];
            }
        }
    }
    return returnString;
}

function getCommonUrl(action)
{
    var queryString = generateQueryString( realArcade.TPS,			realArcade.thirdPartySource,
                                           realArcade.LANG,     	realArcade.language,
                                           realArcade.COUNTRY,  	realArcade.country,
                                           realArcade.CLIENT,   	realArcade.client,
                                           realArcade.PARTNER, 		realArcade.usePartnerPages,
                                           realArcade.SRC,      	realArcade.source,
                                           realArcade.RSRC,     	realArcade.rsrc,
                                           realArcade.LSRC,     	realArcade.lsrc,
                                           realArcade.SPARAM,   	realArcade.sparam,
                                           realArcade.ISRC,     	realArcade.isrc,
                                           realArcade.IRSRC,    	realArcade.irsrc,
                                           realArcade.ILSRC,    	realArcade.ilsrc,
                                           realArcade.GUID,    		realArcade.guid,
                                           realArcade.SUBSCRIPTION, realArcade.subscription,
                                           realArcade.RACTYPE,  	realArcade.ractype,
                                           realArcade.ACTION,   	action );
    
    if( realArcade.DOWNLOAD_ACTION == action ) {
    	return realArcade.downloadBaseUrl + "?" + queryString;
    }
    else {
    	return realArcade.baseUrl + "?" + queryString;	
    }

}

function getDownloadUrl( gameID, gameType, urlArguments )
{
    var undefined;
    
    if ( gameID == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    if ( gameType == undefined )
    {
        gameType = realArcade.DEFAULT_GAME_TYPE;
    }

    var queryString = generateQueryString(realArcade.GAMEID,        gameID,
                                          realArcade.GAMETYPE,      gameType,
  										  realArcade.INSTALLERVERSION,	realArcade.installerVersion);
   
       if ( urlArguments != undefined )
    {
        queryString = queryString + "&" + urlArguments;
    }
    
    
    return getCommonUrl( realArcade.DOWNLOAD_ACTION ) + "&" + queryString;
}

function getBuyUrl( gameID, priceID, gameType, urlArguments )
{
    
    var undefined;
    
    if ( gameID == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    if ( priceID == undefined || priceID == "undefined")
    {
        priceID = realArcade.DEFAULT_PRICE_ID;
    }

    if ( gameType == undefined )
    {
        gameType = realArcade.DEFAULT_GAME_TYPE;
    }

	var queryString = generateQueryString(realArcade.GAMEID,    gameID,
                                          realArcade.PRICEID,   priceID,
                                          realArcade.GAMETYPE,  gameType,
                                          realArcade.RACINSTALLED,  realArcade.racInstalled );

	if ( urlArguments != undefined )
	{
		queryString = queryString + "&" + urlArguments;
	}

    return getCommonUrl( realArcade.BUYURL_ACTION ) + "&" + queryString;
}

function getBuyGpUrl( gpType, initTerm, urlArguments )
{
    var undefined;

    if ( gpType == undefined )
    {
        gpType = realArcade.DEFAULT_GP_TYPE;
    }

    if( initTerm == undefined )
    {
        initTerm = "1";
    }

    var queryString = generateQueryString(realArcade.GAMEPASSTYPE, gpType,
                                          realArcade.RACINSTALLED,  realArcade.racInstalled,
                                          realArcade.INIT_TERM, initTerm );

    if ( urlArguments != undefined )
    {
        queryString = queryString + "&" + urlArguments;
    }

    return getCommonUrl( realArcade.BUYGP_ACTION ) + "&" + queryString;

}

function getActivateGpUrl( initTerm, urlArguments )
{
    var queryString = generateQueryString(realArcade.INIT_TERM, initTerm );
    
    if ( urlArguments != undefined )
    {
        queryString = queryString + "&" + urlArguments;
    }
    
    return getCommonUrl( realArcade.ACTIVATEGP_ACTION ) + "&" + queryString;
}

function getUserReviewUrl( gameID, gameType, access )
{
    var undefined;

    if ( gameID == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    if ( access == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    if ( gameType == undefined )
    {
        gameType = realArcade.DEFAULT_GAME_TYPE;
    }

    var queryString = generateQueryString(realArcade.GAMEID, gameID,
                                          realArcade.GAMETYPE, gameType,
                                          realArcade.ACCESS, access);
    return getCommonUrl(realArcade.USERREVIEW_ACTION) + "&" + queryString;
}


function getScreenShotsUrl( gameID, gameType )
{
    var undefined;

    if ( gameID == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    if ( gameType == undefined )
    {
        gameType = realArcade.DEFAULT_GAME_TYPE;
    }
    var queryString = generateQueryString( realArcade.GAMEID,    gameID,
                                           realArcade.GAMETYPE,  gameType );
    return getCommonUrl( realArcade.SCREENSHOTS_ACTION ) + "&" + queryString;
}

function getGameMessageBoardUrl( gameID, gameType, langID )
{
    var undefined;

    if ( gameID == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    if ( gameType == undefined )
    {
        gameType = realArcade.DEFAULT_GAME_TYPE;
    }

    var queryString = generateQueryString( realArcade.GAMEID,    gameID,
                                           realArcade.GAMETYPE,  gameType );

    return getCommonUrl(realArcade.MESSAGEBOARD_ACTION) + "&" + queryString;
}

function getMessageBoardUrl( boardId )
{
    var undefined;

    if ( boardId == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    var queryString = generateQueryString( realArcade.BOARDID, boardId );

    return getCommonUrl( realArcade.MESSAGEBOARD_ACTION ) + "&" + queryString;
}

function getGameTellAFriendUrl( gameID, gameType )
{
    var undefined;

    if ( gameID == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    if ( gameType == undefined )
    {
        gameType = realArcade.DEFAULT_GAME_TYPE;
    }

    var queryString = generateQueryString( realArcade.GAMEID, gameID,
                                           realArcade.GAMETYPE, gameType);

    return getCommonUrl( realArcade.TELLAFRIEND_ACTION ) + "&" + queryString;
}

function getTellAFriendUrl( tellAFriendId )
{
    var undefined;

    if ( tellAFriendId == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    var queryString = generateQueryString( realArcade.TAFID, tellAFriendId );

    return getCommonUrl( realArcade.TELLAFRIEND_ACTION ) + "&" + queryString;
}

function getLaunchWebGameUrl( gameID, webPlayUrl, urlArguments )
{
    var undefined;

    if ( gameID == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    if ( webPlayUrl == undefined )
    {
		return realArcade.GENERATE_URL_ERROR;
	}

    var queryString = generateQueryString( realArcade.GAMEID,       gameID,
                                           realArcade.SHOCKWAVE,    realArcade.shockwaveInstalled,
                                           realArcade.JAVA,         realArcade.javaEnabled,
                                           realArcade.WEB_PLAY_URL,	webPlayUrl );

	if ( urlArguments != undefined )
	{
		queryString = queryString + "&" + urlArguments;
	}

    return getCommonUrl( realArcade.LAUNCHWEBGAME_ACTION ) + "&" + queryString;
}


function getGamePageUrl( gameID, gameType )
{
    var undefined;

    var pType = realArcade.DEFAULT_GAME_PAGE_TYPE;

    if ( gameID == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    if ( gameType == undefined )
    {
        gameType = realArcade.DEFAULT_GAME_TYPE;
    }

    var queryString = generateQueryString( realArcade.PAGETYPE, pType,
										   realArcade.GAMEID,   gameID,
                                           realArcade.GAMETYPE, gameType );

    return getCommonUrl( realArcade.PAGE_ACTION ) + "&" + queryString;
}

function getGenrePageUrl( genreId )
{
    var undefined;

    var pType = realArcade.DEFAULT_GENRE_PAGE_TYPE;

    if ( genreId == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    var queryString = generateQueryString( realArcade.PAGETYPE, pType,
				                           realArcade.GENREID,  genreId );

    return getCommonUrl( realArcade.PAGE_ACTION ) + "&" + queryString;
}

function getFaqPageUrl( faqId )
{
    var undefined;

    var pType = realArcade.DEFAULT_FAQ_PAGE_TYPE;

    if ( faqId == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    var queryString = generateQueryString( realArcade.PAGETYPE, pType,
                                           realArcade.FAQID,    faqId);

    return getCommonUrl( realArcade.PAGE_ACTION ) + "&" + queryString;
}


function getPageUrl( pType )
{
    var undefined;

    if ( pType == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    var queryString = generateQueryString( realArcade.PAGETYPE, pType );

    return getCommonUrl( realArcade.PAGE_ACTION ) + "&" + queryString;
}

function getPromoPage( gameID, promoType )
{
    var undefined;

    var pType = realArcade.PROMO_PAGE_TYPE;

    if ( gameID == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    if( promoType == undefined )
    {
        promoType = realArcade.DEFAULT_PROMO_PAGE_TYPE;
    }

    var queryString = generateQueryString( realArcade.PAGETYPE, pType,
                                           realArcade.GAMEID, gameID,
                                           realArcade.PROMOTYPE, promoType );

    return getCommonUrl( realArcade.PAGE_ACTION ) + "&" + queryString;
}

function getCouponPage( gameID, ecqs )
{
    var undefined;

    //var pType = realArcade.PROMO_PAGE_TYPE;

    if ( ecqs == undefined || gameID == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    var queryString = generateQueryString(  realArcade.GAMEID, gameID,
                                            realArcade.COUPON, ecqs,
											realArcade.RACINSTALLED,  realArcade.racInstalled );

    return getCommonUrl( realArcade.BUYURL_ACTION ) + "&" + queryString;
}

function getValidateCouponURL( gameID, gameType, urlArguments)
{
    var undefined;

    if ( gameID == undefined )
    {
        return realArcade.GENERATE_URL_ERROR;
    }

    if ( gameType == undefined )
    {
        gameType = realArcade.DEFAULT_GAME_TYPE;
    }

    var queryString = generateQueryString(realArcade.GAMEID,    gameID,
                                          realArcade.GAMETYPE,  gameType,
                                          realArcade.RACINSTALLED,  realArcade.racInstalled );

	if ( urlArguments != undefined )
	{
		queryString = queryString + "&" + urlArguments;
	}
	
	
    return getCommonUrl( realArcade.COUPONPATH_ACTION ) + "&" + queryString;
}
