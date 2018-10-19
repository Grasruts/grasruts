// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require popper/popper.js
//= require bootstrap/js/bootstrap.min.js
//= require slick-carousel/slick/slick.min.js
//= require owl-carousel/owl.carousel.min.js
//= require owl-carousel/carousel.min.js
//= require jquery.countdown/jquery.countdown.min.js
//= require wow/wow.min.js
//= require isotope/isotope.pkgd.min.js
//= require bxslider/jquery.bxslider.min.js
//= require magicsuggest/magicsuggest-min.js
//= require ckeditor/init

//= require main.js



$(document).ready(function(){
  if($('#limit_reward').val() == 'false' || $('#limit_reward').val() == ''){
    $('.total_reward').hide();
  } else{
    $('.total_reward').show();
  }
  $('#limit_reward').on('change', function(){
    if ($(this).val() == 'true'){
        $('.total_reward').show();
    } else {
        $('.total_reward').hide();
    }
  });
});

