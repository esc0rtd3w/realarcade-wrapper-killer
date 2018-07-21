var GameHouseWidget = function () {

	///////EDIT THIS LINE
	this.widgetHome = 'http://media.gamehouse.com/m/gamehouse-games-widget';
	
	this.playLink = 'play-game';

	this.seoLink = '<div id="ghibl"><a href="http://www.gamehouse.com/online-games" target="_blank" class="text">Online Games</a> - Powered by GameHouse Copyright 2010 RealNetworks</div>'

    this.popupOptions = "'width=1000,height=720,menubar=0,directories=0,status=0,location=0'";

	//NO NEED TO EDIT BELOW THIS LINE
	
	this.widgetScriptURL = this.widgetHome + '/js/gamehouse-widget-embed.js';
	
	this.topGamesRSSUrl = 'http://www.gamehouse.com/rss/online-games';
	this.newGamesRSSUrl = 'http://www.gamehouse.com/rss/new-online-games';
	
	this.googleAPIKey = 'ABQIAAAAqge4Z4FvsUf9cI9Xe90l0RSDpJHLZtuQ7bJrVGBG93Us67hx7xRKO4Bd0fOldNMf5G-BSgKvbZ-UKA';
	
	this.topGamesRSS = null;
	this.newGamesRSS = null;
	
	this.itemsCount = 10;
	
        this.theme = 'blue';
	
	this.container = $('#widget-container');
	
	this.contentsHeadingDiv_1 = $('#widget-content-heading-1');
	this.contentsHeadingDiv_2 = $('#widget-content-heading-2');
	this.contentsHeadingDiv_3 = $('#widget-content-heading-3');
	
	this.contentsDiv_1 = $('#widget-contents-1');
	this.contentsDiv_2 = $('#widget-contents-2');
	this.contentsDiv_3 = $('#widget-contents-3');
	
	this.widgetCode = $('#widget-code');

	///////////////////////////////////////////////////////////////////////////////////////
	
	this.init = function () {
	
		this.theme = $.url.param('theme') ? 
		    $.url.param('theme') : this.theme;
		this.applyTheme(this.theme);
		this.loadFeed(this.topGamesRSSUrl, this.topGamesRSS, this.renderFeed, this.contentsDiv_1);
		this.loadFeed(this.newGamesRSSUrl, this.newGamesRSS, this.renderFeed, this.contentsDiv_2);
		this.setEventHandlers();
		this.scriptContents = '<script type="text/javascript" src="' + this.widgetScriptURL + '#theme/'+this.theme+'"></script>'+this.seoLink;
		this.widgetCode.text(this.scriptContents);
		
	};
	
	///////////////////////////////////////////////////////////////////////////////////////
	
	this.applyTheme = function (theme) {
	
		if (theme !== '') {
			this.container.removeClass();
			this.container.addClass(theme);

		}
	
	};
	
	///////////////////////////////////////////////////////////////////////////////////////
	
	this.loadFeed = function (url, target, callback, targetDiv) {

		var ghWidget = this;
		
		$.jGFeed(url, function (feeds) {
				 
			target = feeds;
			callback(target, targetDiv, ghWidget);
			
		}, ghWidget.itemsCount, ghWidget.googleAPIKey);
		
	};
	
	///////////////////////////////////////////////////////////////////////////////////////
	
    this.renderFeed = function (feeds, targetDiv, ghWidget) {

	if (!feeds) {
	    return false;
	}
	
	targetDiv.html();
	
	var renderedContents = '';
        var tracking = { channel: '?channel=gh_wdgt',
                         src: '&src=gh_wdgt' }
	var site = $.url.param('site');
        if (site) {
            tracking['mloc'] = '&mloc='+escape(site);
        }

        // Now that we have host site, update link for GH logo
        jQuery('#logolink').attr('href', 'http://www.gamehouse.com/online-games?channel=gh_wdgt&src=gh-disp-widget&rsrc=widget-ghlogo'+tracking['mloc']);
		
	for (var i = 0; i < feeds.entries.length; i++) {

	    var entry = feeds.entries[i];

            var urlParts = entry.link.split('/');
            var shortName = urlParts[urlParts.length-1];
            if (shortName == '') { shortName = urlParts[urlParts.length-2]; }
            tracking['lsrc'] = '&lsrc='+shortName;
	    var playLink = entry.link.replace('online-games',ghWidget.playLink);
            

	    renderedContents += '<div class="feed-item">';
	    renderedContents += '<h1 class="text">' + entry.title + '</h1>';

            // Image link
            tracking['rsrc'] = '&rsrc=widget-game-image';
	    renderedContents += '<a class="feed-image-link" onclick="javascript:window.open(\'' 
                +entry.link+tracking['channel']+tracking['src']
                +tracking['rsrc']+tracking['lsrc']+tracking['mloc']
                +"','mywindow','width=400,height=200')\" >"+'<img class="feed-image tooltip" title="' + $('<div/>').text(entry.content).html() + '" src="' + entry.mediaGroups[0].contents[0].url + '" /></a>';

            // "Play Now!" link
            tracking['rsrc'] = '&rsrc=widget-play-button';
	    renderedContents += '<a class="feed-play-button text" '
                +"onclick=\"javascript:window.open('"
                +playLink+tracking['channel']+tracking['src']
                +tracking['rsrc']+tracking['lsrc']+tracking['mloc']
                +"','ghwindow',"+ghWidget.popupOptions
                +');">Play Now!</a>';
	    renderedContents += '</div>';
	
	}
	
	targetDiv.append(renderedContents);

	ghWidget.setTooltips();

    };
	
	///////////////////////////////////////////////////////////////////////////////////////
	
	this.setEventHandlers = function () {
	
		var ghWidget = this;
		
		$('.tab').bind('click', function (e) {
		
			$('.tab').removeClass('active');
			$(this).addClass('active');
			
			var contentTab = $(this).attr('rel');
			
			switch (contentTab) {
			
			case 'content_1':
				$('.widget-contents').hide();
				ghWidget.contentsDiv_1.show();
				$('.widget-content-heading').hide();
				ghWidget.contentsHeadingDiv_1.show();
				break;
			
			case 'content_2':
				$('.widget-contents').hide();
				ghWidget.contentsDiv_2.show();
				$('.widget-content-heading').hide();
				ghWidget.contentsHeadingDiv_2.show();
				break;
				
			case 'content_3':
				$('.widget-contents').hide();
				ghWidget.contentsDiv_3.show();
				$('.widget-content-heading').hide();
				ghWidget.contentsHeadingDiv_3.show();
				break;
				
			}
			
		});
		
		$('.colorSwatch').bind('click', function (e) {
			var theme = $(this).attr('rel');
			ghWidget.applyTheme(theme);
			ghWidget.scriptContents = '<script type="text/javascript" src="' + ghWidget.widgetScriptURL + '#theme/' + theme + '"></script>'
                        + ghWidget.seoLink;
			ghWidget.widgetCode.text(ghWidget.scriptContents);
		});
	
	};
	
	////////////////////////////////////////////////////////////////////////////////////////////
	
	this.setTooltips = function () {
		
		$(".tooltip").tipTip({
			maxWidth: '160px'
		});
		
	};
	
	////////////////////////////////////////////////////////////////////////////////////////////
	
};

$(document).ready(function () {
	var ghWidget = new GameHouseWidget();			  
	ghWidget.init();			  
});
