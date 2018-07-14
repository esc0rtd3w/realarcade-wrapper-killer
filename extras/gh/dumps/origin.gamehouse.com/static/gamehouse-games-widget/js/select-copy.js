var clip;
var copier_setup = false;
var copy_to_clip = false;

function highlight_code() {
    code = document.getElementById('widget-code');
    code.focus();
    code.select();
    if (copy_to_clip) {
        setup_copier();
        clip.setText(code.value);
    }
}

function setup_copier() {
    if (!copier_setup) {
        ZeroClipboard.setMoviePath('clipboard/ZeroClipboard.swf');
        clip = new ZeroClipboard.Client();
        clip.setHandCursor(true);
        clip.glue('copy_button');
        copier_setup = true;
    }
}

function getFlashVersion() {
    version = 0;
    try {
	if(navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin){
	    version = (navigator.plugins["Shockwave Flash 2.0"]
                       || navigator.plugins["Shockwave Flash"])
                .description.replace(/\D+/g, ",").match(/^,?([^,]+)/)[1];
	}
    } catch(e) {}		
    return version;
};

jQuery(document).ready(function() {
    if (window.clipboardData) {
        // IE
        jQuery('#copy_button').click(function() {
            window.clipboardData.setData('text', code.value);
        }).css('cursor','pointer');
    } else if (getFlashVersion() >= 9) {
        // Non-IE Flash-enabled browser
        copy_to_clip = true;
    } else {
        // No way to auto-copy
        jQuery('#copy_button').text("Press Ctrl + C to Copy")
            .css({border: '0 none', background: 'transparent'});
    }
});
