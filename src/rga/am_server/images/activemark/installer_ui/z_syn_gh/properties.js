// ----------------------------------------------------------------------------
// ASinstaller.populatePage.prop
// ----------------------------------------------------------------------------
ASinstaller.populatePage.prop = {
  gameName: unescape (decodeURI (ASinstaller.getParam('product_name')).replace(/\+/g,' ')),
  gameImg: 'images/game-eval_image.jpg',
  affCode: ASinstaller.prop.affCode,
  curpage: ASinstaller.getParam ('curpage'),
  maxpage: ASinstaller.getParam ('maxpage'),
  partnerName: 'zylom',
  eulaLink: "http://www.gamehouse.com/notices",
  privacyPolicyLink: "http://www.realnetworks.com/privacy-policy/index.aspx",
  adFavShortcut: true,  // true false shortcut
  pingURLs: [
    "http://activemark.zylom.com/ping/installerstart", 
    "http://activemark.zylom.com/ping/downloadstart", 
    "http://activemark.zylom.com/ping/installationcomplete"
  ],
  doubleping: 0,
  gChromeTermOfServiceUrl: "http://www.google.com/chrome/intl/<LANG>/eula_text.html"
};
