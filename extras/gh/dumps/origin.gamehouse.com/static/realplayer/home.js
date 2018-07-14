$(document).ready(function(){
	var selector = ".ng-images_home_feature .ni-thumbnail .zone-box_image_subtle";
	var imagePath = "http://games-dl2.stage.real.com/images/realplayer/images/";
	var imageName = "temp_featured_placeholder_470_";
	var imageType = ".jpg";
	$(selector).bind("click", function() {
		$(selector).removeClass("role-active");
		$(this).addClass("role-active");
		var currentNumber = $(this).attr("id").substr(15,1);
		var imageSrc = imagePath + imageName + currentNumber + imageType;
		$("#script-feature_0").attr("src", imageSrc);
		$("#zero").html($("#text_" + currentNumber).html());
		
	});
});
