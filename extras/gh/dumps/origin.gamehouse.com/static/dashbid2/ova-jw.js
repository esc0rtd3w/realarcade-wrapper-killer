/*    
 *    Copyright (c) 2010 LongTail AdSolutions, Inc
 *
 *    This file is part of the Open Video Ads VAST framework.
 *
 *    The VAST framework is free software: you can redistribute it 
 *    and/or modify it under the terms of the GNU General Public License 
 *    as published by the Free Software Foundation, either version 3 of 
 *    the License, or (at your option) any later version.
 *
 *    The VAST framework is distributed in the hope that it will be 
 *    useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with the framework.  If not, see <http://www.gnu.org/licenses/>.
 *
 *    @author  Paul Schulz
 *    @date    July 30, 2012
 *    @contact enquiries@openvideoads.org (www.openvideoads.org)
 * 
 */

(function(jwplayer) {

var ovaJWDebug = new function() {
    /*
     * Prints out the debug string to the Javascript console
     */
    this.out = function(output) {
   		try {
      		console.log(output);
   		}
   		catch(error) {}
    }
}

var template = function(_player, _options, div) {

    var _NOT_IMPLEMENTED = "Bridge implementation not available";
    var _nativeImplementation = null;

    /*
     * PLUGIN STARTUP
     */

    function _initialise() {
        if(_player.getRenderingMode() == "html5") {
/*
 *	       	if(true) {
 *			   if(eval("typeof NativeOVAImplementation == 'object'") == false) {
 *		   		  ovaJWDebug.out("Initialising the OVA HTML5 plugin - version 2.0 (Build 3) - loading the OVA for HTML5 library..");
 *	           	  $.getScript('http://localhost/ova/ova.jwplayer.5x/src/html5/ova-jw-native.js',
 * 			         function() {
 * 	 	         		   	ovaJWDebug.out("OVA for JW5 HTML5 library loaded - instantiating native implementation");
 *	            			_nativeImplementation = new NativeOVAImplementation(_player, _options);
 * 	            			_nativeImplementation.start();
 * 	            		}
 * 	           	  );
 *               }
 *         	}
 */
        }
        else ovaJWDebug.out("OVA JS plugin version 1.1.0 Final - operating in 'bridge' mode to the OVA SWF API");
    }


    /*
     * OVA PUBLIC API
     */

    /*
     * Method
     */
    this.play = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaPlay();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    }

    /*
     * Method
     */
    this.pause = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaPause();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    }

    /*
     * Method
     */
    this.resume = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaResume();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    }

    /*
     * Method
     */
    this.getActiveAdDescriptor = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               return document.getElementById(_player.id).ovaGetActiveAdDescriptor();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
        return null;
    }

    /*
     * Method
     */
    this.getVersion = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaGetVersion();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    };

    /*
     * Method
     */
    this.enableAds = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaEnableAds();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    };

    /*
     * Method
     */
    this.disableAds = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaDisableAds();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    };

    /*
     * Method
     */
    this.scheduleAds = function(playlist, newConfig) {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaScheduleAds(playlist, newConfig);
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    };

    /*
     * Method
     */
    this.loadPlaylist = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaLoadPlaylist();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    };

    /*
     * Method
     */
    this.getAdSchedule = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaGetAdSchedule();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    };

    /*
     * Method
     */
    this.getStreamSequence = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaGetStreamSequence();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    };

    /*
     * Method
     */
    this.setDebugLevel = function(levels) {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaSetDebugLevel(levels);
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    };

    /*
     * Method
     */
    this.getDebugLevel = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaGetDebugLevel();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    };

    /*
     * Method
     */
    this.skipAd = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaSkipAd();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    };

    /*
     * Method
     */
    this.clearOverlays = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaClearOverlays();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    };

    /*
     * Method
     */
    this.showOverlay = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaShowOverlay();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    };

    /*
     * Method
     */
    this.hideOverlay = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaHideOverlay();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    };

    /*
     * Method
     */
    this.enableAPI = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaEnableAPI();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    };

    /*
     * Method
     */
    this.disableAPI = function() {
        if(_player.getRenderingMode() == 'flash') {
            try {
               document.getElementById(_player.id).ovaDisableAPI();
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
        }
    };

    /*
     * Method
     */
    this.setActiveLinearAdVolume = function(volume) {
        if(_player.getRenderingMode() == 'flash') {
            try {
               return document.getElementById(_player.id).ovaSetActiveLinearAdVolume(volume);
            }
            catch(error) {
               ovaJWDebug.out(error);
            }
        } else {
            ovaJWDebug.out(_NOT_IMPLEMENTED);
            return false;
        }
    };

    _player.onReady(_initialise);
};


/** Register the plugin with JW Player. **/
jwplayer().registerPlugin('ova', template,'ova-jw.swf');

})(jwplayer);


