// ----------------------------------------------------------------------------
// Installer js for actions in installer slides
// There are 2 name spaces, RAINSTALLER handles calls between installer frame, 
// and ASinstaller handles UI changes and localization
// ----------------------------------------------------------------------------


// Disable context menues
try {
  document.attachEvent ("oncontextmenu", function () {
    event.returnValue = false;
  });
}
catch (e) {}

// ----------------------------------------------------------------------------
// onJSLoadComplete
// ----------------------------------------------------------------------------
function onJSLoadComplete() {
  try {
    RAINSTALLER.RACInstallerControl.JSLoadComplete();
  }
  catch (e) {
    alert(e.name + "\n" + e.message);
  }
}



// ----------------------------------------------------------------------------
// -------------------------------- RAINSTALLER -------------------------------
// ----------------------------------------------------------------------------



// Define RAINSTALLER namespace
if (typeof RAINSTALLER == "undefined") {
  var RAINSTALLER = {};
}

// Define activex controller to installer frame
try {
  RAINSTALLER.RACInstallerControl = new ActiveXObject ("RACInstaller.StateCtrl");
}
catch (e) {
  alert (e.name + "\n" + e.message);
}

// ----------------------------------------------------------------------------
// RAINSTALLER.callLoadComplete
// ----------------------------------------------------------------------------
RAINSTALLER.callLoadComplete = function () {
  try {
    setTimeout("onJSLoadComplete();", 10);
  }
  catch (e) {}
};

// ----------------------------------------------------------------------------
// RAINSTALLER.eula
// ----------------------------------------------------------------------------
RAINSTALLER.eula = {
  getDefaultInstallPath: function () {
    try {
      return RAINSTALLER.RACInstallerControl.InstallPath;
    }
    catch (e) {
      return "";
    }
  },
  chooseInstallPath: function () {
    try {
      RAINSTALLER.RACInstallerControl.DisplayfolderChooser();
    }
    catch (e) {}
  },
  updateInstallPath: function (path) {
    try {
      document.getElementById("installPath").value = path;
    }
    catch (e) {}
  },
  nextButtonAction: function () {
    if (window.actionClicked != true) {
      window.actionClicked = true;

      try {
        // Make sure path has no trailing backslash
        RAINSTALLER.RACInstallerControl.InstallPath = 
          RAINSTALLER.RACInstallerControl.InstallPath.replace (/[\\]$/g, '');
        
        if (!$("#addToFavorites").is (":checked")) {
          RAINSTALLER.RACInstallerControl.RemoveTag ("BookmarkDrop");
        }
        if (!$("#addDesktopShortcut").is (":checked")) {
          RAINSTALLER.RACInstallerControl.RemoveTag ("GameDrop");
        }

        RAINSTALLER.RACInstallerControl.Next();
      }
      catch (e) {}
    }
  }
};

// ----------------------------------------------------------------------------
// RAINSTALLER.install
// ---------------------------------------------------------------------------
RAINSTALLER.install = {
  prop: {
    maxSteps: 294,
    barWidth: 294,
    totalDownloadSize: ''
  },
  getValueFromPair: function (str) {
    try {
      return str.substr(str.indexOf("=") + 1);
    }
    catch (e) {
      return "";
    }
  },
  clearChildNodes: function (nParent) {
    try {
      while (nParent.firstChild) {
        nParent.removeChild(nParent.firstChild);
      }
    }
    catch (e) {}
  },
  IncProgressBarInstaller: function (steps) {
    try {
      document.getElementById("downloading").style.display = 'none';
      document.getElementById("installing").style.display = 'block';
      document.getElementById("totalDownloadSize_container").style.display = 'none';

      if (Number(steps) > this.prop.maxSteps) {
        steps = this.prop.maxSteps;
      }
      var barWidth = (Number (steps) / this.prop.maxSteps) * this.prop.barWidth;
      $(".pb-body-install").css ("width", barWidth);
    }
    catch (e) {}
  },
  IncProgressBar: function (steps) {
    try {
      if (Number(steps) > this.prop.maxSteps) {
        steps = this.prop.maxSteps;
      }
      var barWidth = (((Number(steps)) / this.prop.maxSteps)) * this.prop.barWidth;
      $(".pb-body-download").css ("width", barWidth);
    }
    catch (e) {}
  },
  InitializeProgressInfo: function (str) {
    try {
      var arrParams = str.split("|");
      this.SetProgressGranularity(this.getValueFromPair(arrParams[0]));
      this.totalDownloadSize = this.getValueFromPair(arrParams[2]);
      document.getElementById("totalDownloadSize").innerHTML = this.totalDownloadSize;
    }
    catch (e) {}
  },
  UpdateProgressInfo: function (str) {
    try {
      var arrParams = str.split("|");
      this.SetProgressGranularity (this.getValueFromPair (arrParams[4]));

      $("#totalDownloadSize").html (this.totalDownloadSize);

      var installerPhasevar = this.getValueFromPair (arrParams[0]);
      if (installerPhasevar == "Installing game files") {
        this.IncProgressBarInstaller (this.getValueFromPair (arrParams[1]));
      }
      else {
        this.IncProgressBar (this.getValueFromPair (arrParams[1]));
      }

      $("#installerPhase").html (installerPhasevar);
    }
    catch (e) {}
  },
  SetProgressGranularity: function (maxSteps) {
    try {
      if (Number(maxSteps) > 0) {
        this.prop.maxSteps = Number(maxSteps);
      }
    }
    catch (e) {}
  },
  ProgressToEnd: function () {
    try {
      $(".pb-body-download").css ("width", barWidth);
    }
    catch (e) {};
  },
  ProgressMessage: function (message) {
    try {
      var elem = document.getElementById("progressMessage");
      this.clearChildNodes(elem);
      elem.appendChild(document.createTextNode(message));
    }
    catch (e) {}
  }
};

// ----------------------------------------------------------------------------
// RAINSTALLER.GTBPromo
// ----------------------------------------------------------------------------
RAINSTALLER.GTBPromo = {
  backButtonAction: function () {
    if (window.actionClicked != true) {
      window.actionClicked = true;
      try {
        RAINSTALLER.RACInstallerControl.Previous();
      }
      catch (e) {}
    }
  },
  nextButtonAction: function () {
    if (window.actionClicked != true) {
      window.actionClicked = true;
      try {
        if (document.getElementById ("include_gtb") && !document.getElementById ("include_gtb").checked) {
          RAINSTALLER.RACInstallerControl.RemoveTag("GoogleToolbar");
        }
        RAINSTALLER.RACInstallerControl.Next();
      }
      catch (e) {}
    }
  }
};

// ----------------------------------------------------------------------------
// RAINSTALLER.chromeGTBPromo
// ----------------------------------------------------------------------------
RAINSTALLER.chromeGTBPromo = {
  backButtonAction: function () {
    if (window.actionClicked != true) {
      window.actionClicked = true;
      try {
        RAINSTALLER.RACInstallerControl.Previous();
      }
      catch (e) {}
    }
  },
  nextButtonAction: function () {
    if (window.actionClicked != true) {
      window.actionClicked = true;
      try {
        if (document.getElementById ("include_chrome") && !document.getElementById ("include_chrome").checked) {
          RAINSTALLER.RACInstallerControl.RemoveTag("InstallChrome");
        }
        if (document.getElementById ("default_chrome") && !document.getElementById ("default_chrome").checked) {
          RAINSTALLER.RACInstallerControl.RemoveTag("InstallChrome2");
        }
        if (document.getElementById ("include_gtb") && !document.getElementById ("include_gtb").checked) {
          RAINSTALLER.RACInstallerControl.RemoveTag("GoogleToolbar");
        }
        RAINSTALLER.RACInstallerControl.Next();
      }
      catch (e) {}
    }
  }
};

// ----------------------------------------------------------------------------
// RAINSTALLER.chromePromo
// ----------------------------------------------------------------------------
RAINSTALLER.chromePromo = {
  backButtonAction: function () {
    if (window.actionClicked != true) {
      window.actionClicked = true;
      try {
        RAINSTALLER.RACInstallerControl.Previous();
      }
      catch (e) {}
    }
  },
  nextButtonAction: function () {
    if (window.actionClicked != true) {
      window.actionClicked = true;
      try {
        if (document.getElementById ("include_chrome") && !document.getElementById ("include_chrome").checked) {
          RAINSTALLER.RACInstallerControl.RemoveTag("InstallChrome");
        }
        if (document.getElementById ("default_chrome") && !document.getElementById ("default_chrome").checked) {
          RAINSTALLER.RACInstallerControl.RemoveTag("InstallChrome2");
        }
        RAINSTALLER.RACInstallerControl.Next();
      }
      catch (e) {}
    }
  }
};



// ----------------------------------------------------------------------------
// -------------------------------- ASinstaller -------------------------------
// ----------------------------------------------------------------------------



// Define ASinstaller namespace
if (typeof ASinstaller == 'undefined') {
  var ASinstaller = {};
}

// ----------------------------------------------------------------------------
// ASinstaller.init
// ----------------------------------------------------------------------------
ASinstaller.init = function () {
  ASinstaller.importFile ("_build.js");
  ASinstaller.log.write (R_BUILD_ALL);

  // Initialization of each module in namespace
  var NS = ASinstaller;
  for (var i in NS) {
    if (typeof NS[i].init == 'function') {
      NS[i].init();
    }
  }
};

// ----------------------------------------------------------------------------
// ASinstaller.importFile
// ----------------------------------------------------------------------------
ASinstaller.importFile = function (url) {
  if (/css$/.test (url)) {
    var link = document.createElement ("link");
    link.setAttribute ("rel", "stylesheet");
    link.setAttribute ("type", "text/css");
    link.setAttribute ("href", url);
    document.getElementsByTagName ("head")[0].appendChild (link);
  }
  else {
    var dataType = "text";

    if (/\.js/.test (url)) 
      dataType = "script";
    else if (/html$/.test (url)) 
      dataType = "html";

    try {
      return $.ajax ({
        type: "GET",
        async: false,
        url: url,
        cache: false,
        dataType: dataType,
        error: function (x, st, ert) {
          ASinstaller.log.write ("Error importing file '" + url + "': " + x.status);
        }
      }).response;
    }
    catch (e) {
      ASinstaller.log.write ("Error importing file '" +url+ "': " + e.message);
    }
  }
}

// ----------------------------------------------------------------------------
// ASinstaller.getParam
// ----------------------------------------------------------------------------
ASinstaller.getParam = function (n) {
  n = n.replace(/[\[]/, '\\\[').replace(/[\]]/, '\\\]');
  var r = new RegExp('[\\?&]' + n + '=([^&#]*)');
  var o = r.exec(window.location.href);
  if (o == null) {
    return '';
  }
  else {
    return o[1];
  }
};

// ----------------------------------------------------------------------------
// ASinstaller.prop
// ----------------------------------------------------------------------------
ASinstaller.prop = {
  affCode: ASinstaller.getParam('aff'), //get affiliate from url
  availableLang: {
    en: 'en-us',
    es: 'es-es',
    fr: 'fr-fr',
    de: 'de-de',
    nl: 'nl-nl',
    it: 'it-it',
    sv: 'sv-se',
    pt: 'pt-br',
    jp: 'jp-jp'
  }, //paired with lang code, and locale code
  prettyLang: {
    en: "English",
    es: "Español", 
    fr: "Français", 
    de: "Deutsch", 
    nl: "Nederlands", 
    it: "Italiano", 
    sv: "Svenska", 
    pt: "Português",
    jp: "日本語"
  },
  lang: 'en',
  version: ASinstaller.getParam('version') ? ASinstaller.getParam('version') : '0000'
};

// ----------------------------------------------------------------------------
// ASinstaller.populatePage
// ----------------------------------------------------------------------------
ASinstaller.populatePage = {
  init: function () {
    this.start();
    RAINSTALLER.callLoadComplete();
  }, 
  prop: {}, // js/properties.js file
  start: function () {
    // Set language
    if (ASinstaller.populatePage.prop.useLanguageSelector) {
      // Read language from cookie
      var cookieLang = $.cookie ("installer_language");
      if (cookieLang && (cookieLang in ASinstaller.prop.availableLang)) {
        ASinstaller.prop.lang = cookieLang;
      }

      // Create language selector
      try {
        $.each (ASinstaller.prop.availableLang, function (lCode) {
          var selected = (lCode == ASinstaller.prop.lang)? "1" : null;
          var option = new Option (
            ASinstaller.prop.prettyLang[lCode], 
            lCode, 
            selected, 
            selected
          );
          $(option).html (ASinstaller.prop.prettyLang[lCode]); // IE 7 hack
          $("#lang_selector > select").append (option);
        });
      }
      catch (e) {}

      // Set event for language selector
      $("#lang_selector > select").change (function () {
        var selectedLang = $(this).find ("option:selected").val();
        ASinstaller.populatePage.changeLocalization (selectedLang);
        $.cookie ("installer_language", selectedLang, { expires: 3650 });
      });
    }
    if (ASinstaller.getParam ('lang') != '') {
      var osLang = ASinstaller.getParam ('lang');
      for (lang in ASinstaller.prop.availableLang) {
        if (osLang.substr(0, 2).toLowerCase() == ASinstaller.prop.availableLang[lang].substr(0, 2).toLowerCase()) {
          ASinstaller.prop.lang = lang;
        }
      }
    }
    // Ping Zylom Server
    ASinstaller.zylomPing();

    // Create Game Image
    ASinstaller.createGameImg();

    // Set eula link based on language
    this.prop.privacyPolicyLink = this.prop.privacyPolicyLink.replace ("<LANG>", ASinstaller.prop.lang);
    this.prop.eulaLink = this.prop.eulaLink.replace ("<LANG>", ASinstaller.prop.lang);

    $("#chrome_gameName").html (this.prop.gameName);

    // Do replaces on the page
    if (this.prop.gameImg)
      $("#smallGameImage").attr ("src", this.prop.gameImg);

    $("#gameName").html (this.prop.gameName);
    $("#gameName2").html (this.prop.gameName);
    $("#currentStep").html (this.prop.curpage);
    $("#maxStep").html (this.prop.maxpage);
    $("#installPath").val (RAINSTALLER.eula.getDefaultInstallPath());

    // Set checkbox event for chrome promo page
    $("#include_chrome").click (ASinstaller.chromeChange);

    ASinstaller.populatePage.changeLocalization (ASinstaller.prop.lang);
  },
  changeLocalization: function (lang) {
    $("#eulaLink").attr ("href", this.prop.eulaLink);
    $("#privacyPolicyLink").attr ("href", this.prop.privacyPolicyLink);

    var chromeTos = 
      "javascript:void window.open('http://www.google.com/chrome/intl/" + 
      ASinstaller.prop.availableLang[lang.substr(0, 2).toLowerCase()] + 
      "/eula_text.html', 'win', 'scrollbars,location=no');";

    var chromePrivacy = 
      "javascript:void window.open('http://www.google.com/chrome/intl/" + 
      ASinstaller.prop.availableLang[lang.substr(0, 2).toLowerCase()] + 
      "/privacy.html', 'win', 'scrollbars,location=no');";

    var gtbTos = 
      "javascript:void window.open('http://www.google.com/support/toolbar/bin/answer.py?hl=" + 
      ASinstaller.prop.availableLang[lang.substr(0, 2).toLowerCase()] + 
      "&answer=115261', 'win', 'scrollbars,location=no');";

    var gtbPrivacy = 
      "javascript:void window.open('http://www.google.com/support/toolbar/bin/answer.py?hl=" + 
      ASinstaller.prop.availableLang[lang.substr(0, 2).toLowerCase()] + 
      "&answer=81841&rd=2', 'win', 'scrollbars,location=no');";

    $("#chrome_tos_link").attr ("href", chromeTos);
    $("#chrome_privacy_link").attr ("href", chromePrivacy);
    $("#gtb_tos_link").attr ("href", gtbTos);
    $("#gtb_privacy_link").attr ("href", gtbPrivacy);

    // Do text replacements
    var locRegEx = /^loc_/i;
    $("span").each (function () {
      var className = $(this).attr ("class");
      if (locRegEx.test (className)) {
        if (ASinstaller.loc[lang][className])
          $(this).html (ASinstaller.loc[lang][className]);
        else 
          $(this).html ("");
      }
    });

    // Localise buttons
    if (typeof (ASinstaller.loc[lang].loc_choose_folder) != "undefined")
      $("#chooseFolderBtn").val (ASinstaller.loc[lang].loc_choose_folder);

    $("#pageContainer").addClass (lang);

    // Set top-banner url
    if (this.prop.topbanner)
      $("#topbanner").attr ("src", this.prop.topbanner.replace ("<LANG>", lang));
  }
};

// ----------------------------------------------------------------------------
// ASinstaller.fitInPlace
// ----------------------------------------------------------------------------
ASinstaller.fitInPlace = function (el, max_height) {
  if ($(el).height() > max_height) {
    var size = parseInt($(el).css('fontSize'), 10) - 1;
    $(el).css({
      'fontSize': size
    });
    ASinstaller.fitInPlace(el, max_height);
  }
};

// ----------------------------------------------------------------------------
// ASinstaller.createGameImg
// ----------------------------------------------------------------------------
ASinstaller.createGameImg = function () {
  var cid = ASinstaller.getParam ("contentid").toLowerCase();
  var urlTmpl = "http://cdn.media.zylom.com/images/activemark/ors/<CID>/<SIZE>.jpg";

  var urlBig = urlTmpl.replace ("<CID>", cid).replace ("<SIZE>", "160x250");
  var urlSmall = urlTmpl.replace ("<CID>", cid).replace ("<SIZE>", "50x50");

  if (typeof (ASinstaller.populatePage.prop.bigGameImage) != "undefined") {
    var imgBig = new Image();
    imgBig.onload = function () {
      ASinstaller.populatePage.prop.bigGameImage = urlBig;
      $("#bigGameImage").attr ("src", urlBig);
    };
    imgBig.onerror = function () {
      $('#bigGameImage').remove();
    };

    imgBig.src = urlBig; // fires off loading of image
  }

  if (typeof (ASinstaller.populatePage.prop.gameImg) != "undefined") {
    var imgSmall = new Image();
    imgSmall.onload = function () {
      ASinstaller.populatePage.prop.gameImg = urlSmall;
      $("#smallGameImage").attr ("src", urlSmall);
    };
    imgSmall.onerror = function () {
      $('#smallGameImage').attr ("src", ASinstaller.populatePage.prop.gameImg);
    };

    imgSmall.src = urlSmall; // fires off loading of image
  }
};

// ----------------------------------------------------------------------------
// ASinstaller.zylomPing
// ----------------------------------------------------------------------------
ASinstaller.zylomPing = function () {
  var installer_cookie_name = "installer_step";
  // Check current ping step
  var current_step = 0;
  var previous_step = -1;

  if (typeof (ping_step) !== 'undefined') {
    current_step = ping_step;
  }

  // check previous ping step
  previous_step = ASinstaller.getCookie(installer_cookie_name);
  if (previous_step == null) {
    previous_step = -1;
  }

  if (ASinstaller.populatePage.prop.doubleping == 0) {
    var systemID = "";
    try {
      shell = new ActiveXObject("StubbyUtil.ShellCtl");
      systemID = shell.GetSystemID();
    }
    catch (err) {}
    var contentID = ASinstaller.getParam('contentid');
    var offering = ASinstaller.getParam('offering');
    var tracking = ASinstaller.getParam('tracking');
    var extratracking = ASinstaller.getParam('extratracking');

    for (var i = parseInt(previous_step) + 1; i < parseInt(current_step) + 1; i++) {
      var msg = ASinstaller.populatePage.prop.pingURLs[i] + "?contentID=" + 
                contentID + "&lang=" + ASinstaller.prop.lang + "&offering=" + 
                offering + "&systemID=" + systemID + "&tracking=" + tracking + 
                "&extratracking=" + extratracking;

      // Doing the actual ping
      ASinstaller.doPing(msg);
    }

    // Setting cookie with the current installer step
    document.cookie = installer_cookie_name + "=" + parseInt(current_step);

    // Avoiding double ping
    ASinstaller.populatePage.prop.doubleping = 1;
  }
};

// ----------------------------------------------------------------------------
// ASinstaller.doPing
// ----------------------------------------------------------------------------
ASinstaller.doPing = function (pingUrl) {
  var img = new Image();
  img.src = pingUrl;
};

// ----------------------------------------------------------------------------
// ASinstaller.getCookie
// ----------------------------------------------------------------------------
ASinstaller.getCookie = function (Name) {
  var search = Name + "="
  var returnvalue = null;
  if (document.cookie.length > 0) {
    offset = document.cookie.indexOf(search)
    // if cookie exists
    if (offset != -1) {
      offset += search.length
      // set index of beginning of value
      end = document.cookie.indexOf(";", offset);
      // set index of end of cookie value
      if (end == -1) end = document.cookie.length;
      returnvalue = unescape(document.cookie.substring(offset, end))
    }
  }
  return returnvalue;
};

// ----------------------------------------------------------------------------
// ASinstaller.chromeChange
// ----------------------------------------------------------------------------
ASinstaller.chromeChange = function () {
  try {
    if (document.getElementById('include_chrome').checked) {
      document.getElementById('default_chrome').disabled = false;
    }
    else {
      document.getElementById('default_chrome').disabled = true;
    }
  }
  catch (e) {}
};

// ----------------------------------------------------------------------------
// ASinstaller.analytics
// ----------------------------------------------------------------------------
ASinstaller.analytics = {
  init: function () {
    this.track();
  },
  prop: {},
  track: function () {
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-13024989-1']);
    _gaq.push(['_setDomainName', 'none']);
    _gaq.push(['_setAllowAnchor', true])
    _gaq.push(['_setAllowLinker', true])
    _gaq.push(['_trackPageview']);
    (function () {
      var ga = document.createElement('script');
      ga.type = 'text/javascript';
      ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ga);
    })();
  }
};

// ----------------------------------------------------------------------------
// ASinstaller.log
// ----------------------------------------------------------------------------
ASinstaller.log = {
  write: function() {
    var text = '[' + new Date().toLocaleTimeString() + '] ';
    text += Array.prototype.join.call (arguments, ' ');

    if (window.console && window.console.log)
      window.console.log (text);

    ASinstaller.log._fullLog = ASinstaller.log._fullLog + "\n" + text;
  },
  _fullLog: ""
};

// ----------------------------------------------------------------------------
// keypress
// ----------------------------------------------------------------------------
$(document).keypress (function (evt) {
  // CTRL + ENTER
  if (evt.ctrlKey && ((evt.which == 10) || (evt.which == 13))) {
    if (!$("#asinstaller-log-container").get (0)) {
      var div = document.createElement ('div');

      div.style.position = "absolute";
      div.style.overflow = "auto";
      div.style.padding = "0px 10px";
      div.style.zIndex = 10000;
      div.style.left = "0px";
      div.style.top = "0px";
      div.style.width = "100%";
      div.style.height = "50%";
      div.style.display = "none";
      div.style.background = "#F6F6F6";
      div.style.fontSize = "10px";
      div.style.opacity = 0.90;
      div.style.filter = "alpha(opacity=90)";
      div.style.color = "black";
      div.style.fontWeight = "bold";
      div.id = "asinstaller-log-container";

      $("body").append (div);
      
      // Set interval
      window.setInterval (_updateLog = function() {
        $("#asinstaller-log-container").html (
          "<pre>" + ASinstaller.log._fullLog + "</pre>"
        );
      }, 1000);
      _updateLog();
    }

    if ($("#asinstaller-log-container").attr ("up") == "false") {
      $("#asinstaller-log-container").slideUp ("slow");
      $("#asinstaller-log-container").attr ("up", "true");
    }
    else {
      $("#asinstaller-log-container").slideDown ("slow");
      $("#asinstaller-log-container").attr ("up", "false");      
    }
  }
});

$(document).ready (ASinstaller.init);

