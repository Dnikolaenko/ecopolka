function img_path(img_number) {
	var img_path = path_before + img_name + img_number + img_type;
	return img_path;
}


var path_before="image/catalog/";
var img_number=2;
var img_type=".jpg";
var img_name="slide-mini-"; //img name without index ( -id )

var pre_initNext = 2;
var pre_initPrev = 3;
function navigation_img() {
	if($('#camera_with_nav').length) {
	$('.camera_prev .img').css("background", "url('"+img_path(pre_initPrev)+"')");
	$('.camera_next .img').css("background", "url('"+img_path(pre_initNext)+"')");
	var img_number1 = pre_initNext;
	var img_number2 = pre_initPrev;
	$( ".camera_next" ).click(function() {
  		if(img_number1 == 3) {
  			img_number1 = 1;
  			$('.camera_next .img').css("background", "url('"+img_path(img_number1)+"')");
  			img_number2 = 2;
  			$('.camera_prev .img').css("background", "url('"+img_path(img_number2)+"')");
  		} else {
  			if(img_number1 == 1){
  				img_number2 = 3;
  			} else {
  				img_number2 = img_number1-1;
  			}
  			img_number1++;
  			$('.camera_next .img').css("background", "url('"+img_path(img_number1)+"')");
  			$('.camera_prev .img').css("background", "url('"+img_path(img_number2)+"')");
  		}	
	});	
	$( ".camera_prev" ).click(function() {
  		if(img_number2 == 1) {
  			img_number1 = 2;
  			$('.camera_next .img').css("background", "url('"+img_path(img_number1)+"')");
  			img_number2 = 3;
  			$('.camera_prev .img').css("background", "url('"+img_path(img_number2)+"')");
  		} else {
  			if(img_number2 == 3){
  				img_number1 = 1;
  			} else {
  				img_number1 = img_number2+1;
  			}
  			img_number2--;
  			$('.camera_next .img').css("background", "url('"+img_path(img_number1)+"')");
  			$('.camera_prev .img').css("background", "url('"+img_path(img_number2)+"')");
  		}	
	});
	}
}
$(window).load(navigation_img);


