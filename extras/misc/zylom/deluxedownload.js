//<!--
function showInstructionPage(gsid, sgid)
{
    window.location = "http://www.zylom.com/rdownloadinstruction.jsp?g="+gsid+"&s="+sgid;
}

function downloadAgain(gsid, sgid, lid, b, r)
{
  try
  {
      pageTracker._trackPageview('/download/' + sgid);
  }catch(e){}

   window.location = 'http://main.zylom.com/servlet/DownloadDownloadable?g=' + gsid + '&s=' + sgid;
}

function getCookieVal(offset)
{
  var endstr = document.cookie.indexOf (";", offset);
  if (endstr == -1) { endstr = document.cookie.length; }
  return unescape(document.cookie.substring(offset, endstr));
}

function getCookie(name)
{
  var arg = name + "=";
  var alen = arg.length;
  var clen = document.cookie.length;
  var i = 0;
  while (i < clen) {
    var j = i + alen;
    if (document.cookie.substring(i, j) == arg) {
      return getCookieVal (j);
      }
    i = document.cookie.indexOf(" ", i) + 1;
    if (i == 0) break;
    }
  return null;
}

function start(gsid, sgid, lid, b)
{
  download(gsid, sgid, lid, b, 0);
}

function download(gsid, sgid, lid, b, r)
{
  try
  {
      pageTracker._trackPageview('/download/' + sgid);
  }catch(e){}

  window.location = 'http://main.zylom.com/servlet/DownloadDownloadable?g=' + gsid + '&s=' + sgid;

  if(gsid == 4 || gsid == 8 || gsid == 16 || gsid == 49) //zylom
  {
    setTimeout('showInstructionPage("'+gsid+'","'+ sgid+'")', 10000);
  }
}
//-->