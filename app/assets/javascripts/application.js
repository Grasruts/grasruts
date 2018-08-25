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
//= require owl-carousel/owl.carousel.min.js
//= require jquery.countdown/jquery.countdown.min.js
//= require wow/wow.min.js
//= require isotope/isotope.pkgd.min.js
//= require bxslider/jquery.bxslider.min.js
//= require magicsuggest/magicsuggest-min.js
//= require main.js
//= require froala_editor.min.js
//= require plugins/align.min.js
//= require plugins/char_counter.min.js
//= require plugins/code_beautifier.min.js
//= require plugins/code_view.min.js
//= require plugins/colors.min.js
//= require plugins/emoticons.min.js
//= require plugins/entities.min.js
//= require plugins/file.min.js
//= require plugins/font_family.min.js
//= require plugins/font_size.min.js
//= require plugins/fullscreen.min.js
//= require plugins/help.min.js
//= require plugins/image.min.js
//= require plugins/inline_style.min.js
//= require plugins/line_breaker.min.js
//= require plugins/link.min.js
//= require plugins/lists.min.js
//= require plugins/paragraph_format.min.js
//= require plugins/paragraph_style.min.js
//= require plugins/print.min.js
//= require plugins/quick_insert.min.js
//= require plugins/quote.min.js
//= require plugins/save.min.js
//= require plugins/table.min.js
//= require plugins/special_characters.min.js
//= require plugins/url.min.js


$(document).ready(function(){
  $('#story')
    .froalaEditor({
      requestHeaders: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      imageUploadURL: '/campaign/froala/upload_image',
      // imageUploadParam: 'image_param',
      imageAllowedTypes: ['jpeg', 'jpg', 'png', 'gif'],
      // imageUploadParams: {id: 'my_editor'},
      imageUploadMethod: 'POST',
      imageMaxSize: 5 * 1024 * 1024
    });
});
// })();

