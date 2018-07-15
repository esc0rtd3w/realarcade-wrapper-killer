function MM_findObj(n, d) { //v3.0

  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {

    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}

  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];

  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;

}



function MM_showHideLayers() { //v3.0

  var i,p,v,obj,args=MM_showHideLayers.arguments;

  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];

    if (obj.style) { obj=obj.style; v=(v=='show')?'':(v='hide')?'none':v; }

    obj.display=v; }

}



function MM_openBrWindow(theURL,winName,features) { //v2.0

  window.open(theURL,winName,features);

  }



function popWin(url, w, h) {

		var madURL = url;

		var x, y, winStr;

		

		x=0; y=0;

	

		self.name="opener";

		winStr = "height="+(h+13)+",width="+w+",screenX="+x+",left="+x+",screenY="+y+",top="+y+",channelmode=0,dependent=0,directories=0,fullscreen=0,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0";

		

		lilBaby = window.open(madURL, "_blank", winStr);

}



function changeGame(game)

					{

					

						var newwin=window.open("http://realguide.real.com/games/crossword/?pop=game&puzz="+game,"newwin","width=600,height=550,scrollbars,resizable,location");

					}

					



function checkUpdate(expiration)

			{

			var now = new Date()

			var nextissue = new Date(expiration);

			var days = Math.floor(((nextissue.getTime() - now.getTime()) / (1000 * 24 * 60 * 60)) + 1);

			//This is the previous code.
			//if (days <= 0) document.write("<table cellspacing=0 cellpadding=0 border=0><tr><a href=realarcade:\//updatecontent\><td width=173 height=17 class=\"updatenews\" align=center>Update Game News<\/td><\/a><\/tr><\/table>");

			if (days <= 0) document.write('<table border=0 cellpadding=0 cellspacing=0><tr><td width=26 valign=top align=right class=\"topheader\"><img src=\"images\/headerswoop\.gif\" width=26 height=30 border=0><\/td><td><table border=0 cellpadding=0 cellspacing=0><tr><td colspan=3><img src=\"images\/spacer\.gif\" width=5 height=4 border=0><\/td><\/tr><tr><a href=realarcade:\//updatecontent\><td width=24><img src=\"images\/button_left_4gg\.gif\" width=24 height=26><\/td><td background=\"images\/button_center\.gif\" nowrap class=\"buttontext\">UPDATE GAME GUIDE<\/td><td width=\"14\"><img src=\"images\/button_right\.gif\" width=14 height=26><\/td><\/a><\/tr><\/table><\/td><\/tr><\/table>');
			

			}

