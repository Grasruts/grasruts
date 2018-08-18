function  readURL(input,thumbimage) {
   	if  (input.files && input.files[0]) { 
   	var  reader = new FileReader();
    reader.onload = function (e) {
    $("#thumbimage").attr('src', e.target.result);
     	}
     	reader.readAsDataURL(input.files[0]);
    }
    else  { // Sử dụng cho IE
      	$("#thumbimage").attr('src', input.value);
    }
    $("#thumbimage").show();
    $('.filename').text($("#uploadfile").val());
    $('.choicefile').css('background', '#C4C4C4');
    $('.choicefile').css('cursor', 'default');
    $(".removeimg").show();
    $(".choicefile").hide();       
}
function  readURL1(input,thumbimage) {
   	if  (input.files && input.files[0]) { 
   	var  reader = new FileReader();
    reader.onload = function (e) {
    $("#thumbimage1").attr('src', e.target.result);
     	}
     	reader.readAsDataURL(input.files[0]);
    }
    else  { // Sử dụng cho IE
      	$("#thumbimage1").attr('src', input.value);
    }
    $("#thumbimage1").show();
    $('.filename1').text($("#uploadfile").val());
    $('.choicefile1').css('background', '#C4C4C4');
    $('.choicefile1').css('cursor', 'default');
    $(".removeimg1").show();
    $(".choicefile1").hide();       
}
function  readURL2(input,thumbimage) {
   	if  (input.files && input.files[0]) { 
   	var  reader = new FileReader();
    reader.onload = function (e) {
    $("#thumbimage2").attr('src', e.target.result);
     	}
     	reader.readAsDataURL(input.files[0]);
    }
    else  { // Sử dụng cho IE
      	$("#thumbimage2").attr('src', input.value);
    }
    $("#thumbimage2").show();
    $('.filename2').text($("#uploadfile").val());
    $('.choicefile2').css('background', '#C4C4C4');
    $('.choicefile2').css('cursor', 'default');
    $(".removeimg2").show();
    $(".choicefile2").hide();       
}
function  readURL3(input,thumbimage) {
   	if  (input.files && input.files[0]) { 
   	var  reader = new FileReader();
    reader.onload = function (e) {
    $("#thumbimage3").attr('src', e.target.result);
     	}
     	reader.readAsDataURL(input.files[0]);
    }
    else  { // Sử dụng cho IE
      	$("#thumbimage3").attr('src', input.value);
    }
    $("#thumbimage3").show();
    $('.filename3').text($("#uploadfile").val());
    $('.choicefile3').css('background', '#C4C4C4');
    $('.choicefile3').css('cursor', 'default');
    $(".removeimg3").show();
    $(".choicefile3").hide();       
}
function  readURL4(input,thumbimage) {
   	if  (input.files && input.files[0]) { 
   	var  reader = new FileReader();
    reader.onload = function (e) {
    $("#thumbimage4").attr('src', e.target.result);
     	}
     	reader.readAsDataURL(input.files[0]);
    }
    else  { // Sử dụng cho IE
      	$("#thumbimage4").attr('src', input.value);
    }
    $("#thumbimage4").show();
    $('.filename4').text($("#uploadfile").val());
    $('.choicefile4').css('background', '#C4C4C4');
    $('.choicefile4').css('cursor', 'default');
    $(".removeimg4").show();
    $(".choicefile4").hide();       
}
function  readURL5(input,thumbimage) {
   	if  (input.files && input.files[0]) { 
   	var  reader = new FileReader();
    reader.onload = function (e) {
    $("#thumbimage5").attr('src', e.target.result);
     	}
     	reader.readAsDataURL(input.files[0]);
    }
    else  { // Sử dụng cho IE
      	$("#thumbimage5").attr('src', input.value);
    }
    $("#thumbimage5").show();
    $('.filename5').text($("#uploadfile").val());
    $('.choicefile5').css('background', '#C4C4C4');
    $('.choicefile5').css('cursor', 'default');
    $(".removeimg5").show();
    $(".choicefile5").hide();       
}
function  readURL6(input,thumbimage) {
   	if  (input.files && input.files[0]) { 
   	var  reader = new FileReader();
    reader.onload = function (e) {
    $("#thumbimage6").attr('src', e.target.result);
     	}
     	reader.readAsDataURL(input.files[0]);
    }
    else  { // Sử dụng cho IE
      	$("#thumbimage6").attr('src', input.value);
    }
    $("#thumbimage6").show();
    $('.filename6').text($("#uploadfile").val());
    $('.choicefile6').css('background', '#C4C4C4');
    $('.choicefile6').css('cursor', 'default');
    $(".removeimg6").show();
    $(".choicefile6").hide();       
}
(function($) {
	"use strict";

	/*  [ jQuery Upload File ]
        - - - - - - - - - - - - - - - - - - - - */
	
	$(document).ready(function() {

		$(".choicefile").bind('click', function  () { 
	    	$("#uploadfile").click();
	    });
	   	$(".removeimg").on('click', function() {
	     	$("#thumbimage").attr('src', '').hide();
	      	$("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
	      	$(".removeimg").hide();
	      	$(".choicefile").show();
	      	$(".choicefile").bind('click', function  () {
	       		$("#uploadfile").click();
	      	});
	      	$('.choicefile').css('background','#C4C4C4');
	      	$('.choicefile').css('cursor', 'pointer');
	      	$(".filename").text("");
	    });

	    $(".choicefile1").bind('click', function  () { 
	    	$("#uploadfile1").click();
	    });
	   	$(".removeimg1").on('click', function() {
	     	$("#thumbimage1").attr('src', '').hide();
	      	$("#myfileupload1").html('<input type="file" id="uploadfile1"  onchange="readURL1(this);" />');
	      	$(".removeimg1").hide();
	      	$(".choicefile1").show();
	      	$(".choicefile1").bind('click', function  () {
	       		$("#uploadfile1").click();
	      	});
	      	$('.choicefile1').css('background','#C4C4C4');
	      	$('.choicefile1').css('cursor', 'pointer');
	      	$(".filename1").text("");
	    });

	    $(".choicefile2").bind('click', function  () { 
	    	$("#uploadfile2").click();
	    });
	   	$(".removeimg2").on('click', function() {
	     	$("#thumbimage2").attr('src', '').hide();
	      	$("#myfileupload2").html('<input type="file" id="uploadfile2"  onchange="readURL2(this);" />');
	      	$(".removeimg2").hide();
	      	$(".choicefile2").show();
	      	$(".choicefile2").bind('click', function  () {
	       		$("#uploadfile2").click();
	      	});
	      	$('.choicefile2').css('background','#C4C4C4');
	      	$('.choicefile2').css('cursor', 'pointer');
	      	$(".filename2").text("");
	    });
	    $(".choicefile3").bind('click', function  () { 
	    	$("#uploadfile3").click();
	    });
	   	$(".removeimg3").on('click', function() {
	     	$("#thumbimage3").attr('src', '').hide();
	      	$("#myfileupload3").html('<input type="file" id="uploadfile3"  onchange="readURL3(this);" />');
	      	$(".removeimg3").hide();
	      	$(".choicefile3").show();
	      	$(".choicefile3").bind('click', function  () {
	       		$("#uploadfile3").click();
	      	});
	      	$('.choicefile3').css('background','#C4C4C4');
	      	$('.choicefile3').css('cursor', 'pointer');
	      	$(".filename3").text("");
	    });
	    $(".choicefile4").bind('click', function  () { 
	    	$("#uploadfile4").click();
	    });
	   	$(".removeimg4").on('click', function() {
	     	$("#thumbimage4").attr('src', '').hide();
	      	$("#myfileupload4").html('<input type="file" id="uploadfile4"  onchange="readURL4(this);" />');
	      	$(".removeimg4").hide();
	      	$(".choicefile4").show();
	      	$(".choicefile4").bind('click', function  () {
	       		$("#uploadfile4").click();
	      	});
	      	$('.choicefile4').css('background','#C4C4C4');
	      	$('.choicefile4').css('cursor', 'pointer');
	      	$(".filename4").text("");
	    });
	    $(".choicefile5").bind('click', function  () { 
	    	$("#uploadfile5").click();
	    });
	   	$(".removeimg5").on('click', function() {
	     	$("#thumbimage5").attr('src', '').hide();
	      	$("#myfileupload5").html('<input type="file" id="uploadfile5"  onchange="readURL5(this);" />');
	      	$(".removeimg5").hide();
	      	$(".choicefile5").show();
	      	$(".choicefile5").bind('click', function  () {
	       		$("#uploadfile5").click();
	      	});
	      	$('.choicefile5').css('background','#C4C4C4');
	      	$('.choicefile5').css('cursor', 'pointer');
	      	$(".filename5").text("");
	    });
	    $(".choicefile6").bind('click', function  () { 
	    	$("#uploadfile6").click();
	    });
	   	$(".removeimg6").on('click', function() {
	     	$("#thumbimage6").attr('src', '').hide();
	      	$("#myfileupload6").html('<input type="file" id="uploadfile6"  onchange="readURL6(this);" />');
	      	$(".removeimg6").hide();
	      	$(".choicefile6").show();
	      	$(".choicefile6").bind('click', function  () {
	       		$("#uploadfile6").click();
	      	});
	      	$('.choicefile6').css('background','#C4C4C4');
	      	$('.choicefile6').css('cursor', 'pointer');
	      	$(".filename6").text("");
	    });
		/*  [ Menu Moblie ]
        - - - - - - - - - - - - - - - - - - - - */
		var toggles = document.querySelectorAll(".c-hamburger");
		  	for (var i = toggles.length - 1; i >= 0; i--) {
		    	var toggle = toggles[i];
		    toggleHandler(toggle);
		  	};
		function toggleHandler(toggle) {
		    toggle.addEventListener( "click", function(e) {
		    	e.preventDefault();
		    	(this.classList.contains("is-active") === true) ? this.classList.remove("is-active") : this.classList.add("is-active");
		    });
		}

		/*  [ Back Top ]
        - - - - - - - - - - - - - - - - - - - - */
		$('.back-top').on('click', function (e) {
	        e.preventDefault();
	        $('html,body').animate({
	            scrollTop: 0
	        }, 700);
	    });

	    /*  [ Staff Picks Slider ]
        - - - - - - - - - - - - - - - - - - - - */
	    $('.staff-picks-slider').owlCarousel({
			loop:true,
			autoplay:true,
			autoplayTimeout:3000,
   			autoplayHoverPause:true,
   			items: 1,
   			dots: false,
   			nav: true,
   			navText: ['<span class="ion-ios-arrow-back"></span>', '<span class="ion-ios-arrow-forward"></span>'],
		});

	    /*  [ Partners ]
        - - - - - - - - - - - - - - - - - - - - */
	    $('.partners-slider').owlCarousel({
			loop:true,
			autoplay:true,
			autoplayTimeout:3000,
   			autoplayHoverPause:true,
   			items: 6,
   			dots: false,
   			nav: false,
   			responsive:{
		        0:{
		            items:1,
		        },
		        360:{
		            items:2,
		        },
		        576:{
		            items:3,
		        },
		        992:{
		            items:6,
		        }
		    }
		});

	    /*  [ Story Slider ]
        - - - - - - - - - - - - - - - - - - - - */
        $('.story-slider').owlCarousel({
			loop:true,
			autoplay:true,
			autoplayTimeout:3000,
   			autoplayHoverPause:true,
   			items: 3,
   			margin: 30,
   			responsive:{
		        0:{
		            items:1,
		        },
		        450:{
		            items:1,
		        },
		        576:{
		            items:2,
		        },
		        992:{
		            items:3,
		        }
		    }
		});

        /*  [ Featured Places Slider ]
        - - - - - - - - - - - - - - - - - - - - */
        $('.featured-places-slider').owlCarousel({
			loop:true,
			autoplay:true,
			autoplayTimeout:3000,
   			autoplayHoverPause:true,
   			margin: 30,
   			nav: true,
   			navText: ['<span class="ion-ios-arrow-back"></span>', '<span class="ion-ios-arrow-forward"></span>'],
   			responsive:{
		        0:{
		            items:1,
		        },
		        360:{
		            items:3,
		        },
		        576:{
		            items:4,
		        },
		        992:{
		            items:5,
		        },
		        1200:{
		            items:6,
		        }
		    }
		});

		/*  [ Owl Campaign ]
        - - - - - - - - - - - - - - - - - - - - */
		$("#owl-campaign").owlCarousel({
	        navigation: true,
	        navigationText: ['<span class="ion-ios-arrow-back"></span>', '<span class="ion-ios-arrow-forward"></span>'],
	        loop:true,
			autoplay:true,
			autoplayTimeout:3000,
   			autoplayHoverPause:true,
	        singleItem: true,
	        afterInit: makePages,
	        afterUpdate: makePages
	    });
	    function makePages() {
	        $.each(this.owl.userItems, function(i) {
	            $('.owl-controls .owl-page').eq(i)
	                .css({
	                    'background': 'url(' + $(this).find('img').attr('src') + ')',
	                    'background-size': 'cover',
	                })
	        });
	    };	

	    /*  [ Owl Shop ]
        - - - - - - - - - - - - - - - - - - - - */
		$("#owl-shop").owlCarousel({
	        navigation: true,
	        navigationText: ['<span class="ion-ios-arrow-back"></span>', '<span class="ion-ios-arrow-forward"></span>'],
	        loop:true,
			autoplay:true,
			autoplayTimeout:3000,
   			autoplayHoverPause:true,
	        singleItem: true,
	        afterInit: makePages,
	        afterUpdate: makePages
	    });
	    function makePages1() {
	        $.each(this.owl.userItems, function(i) {
	            $('.owl-controls .owl-page').eq(i)
	                .css({
	                    'background': 'url(' + $(this).find('img').attr('src') + ')',
	                    'background-size': 'cover',
	                })
	        });
	    };	

	    /*  [ Tab Controls ]
        - - - - - - - - - - - - - - - - - - - - */
        $('.menu-category li.mc-option').on('click', function (e){
	    	e.preventDefault();
			var tab_id = $(this).attr('data-tab');
			$('.menu-category li.mc-option').removeClass('active');
			$('.popular-project .pp-item').removeClass('active');
			$(this).addClass('active');
			$("#"+tab_id).addClass('active');
		});

	    $('.tabs-controls li').on('click', function (e){
	    	e.preventDefault();
			var tab_id = $(this).attr('data-tab');
			$('.tabs-controls li').removeClass('active');
			$('.campaign-content .tabs').removeClass('active');
			$(this).addClass('active');
			$("#"+tab_id).addClass('active');
		});
		/*  [ Menu Category ]
        - - - - - - - - - - - - - - - - - - - - */
		$('.menu-category li.mc-option').on('click', function (){
			var tab_id = $(this).attr('data-hash');
			$('.menu-category li.mc-option').removeClass('active');
			$(this).addClass('active');
		});
		$('.menu-category li.cat-more a').on('click', function (){
			var url = $(this).attr('href');
			window.location.href = url;
		});

		/*  [ Project Love Slider ]
        - - - - - - - - - - - - - - - - - - - - */
	 	$('.project-love-slider').bxSlider({
		  	pagerCustom: '#bx-pager',
		  	mode: 'vertical',
		  	controls: false,
		});
	    /*  [ Search Form ]
        - - - - - - - - - - - - - - - - - - - - */
	 $('.search-icon a').on('click', function (e){
    	e.preventDefault();
			$( this ).parent().find('.form-search').fadeToggle();
			$( this ).parent().find('#searchForm').fadeToggle();
		});

		$('.form-search').on('click', function (e){
	    	e.preventDefault();
			$( this ).fadeToggle();
			$( this ).parent().find('#searchForm').fadeToggle();
		});

		$(".raised > span").each(function() {
			$(this)
				.data("origWidth", $(this).width())
				.width(0)
				.animate({
					width: $(this).data("origWidth")
				}, 1200);
		});

		/*  [ Main Menu ]
        - - - - - - - - - - - - - - - - - - - - */
		$( '.c-hamburger' ).on( 'click', function() {
            $( this ).parents( '.main-menu' ).toggleClass('open');
            $( 'body' ).toggleClass( 'menu-open' );
        });
        $( 'html' ).on( 'click', function(e) {
            if( $( e.target ).closest( '.main-menu.open' ).length == 0 ) {
                $( '.main-menu' ).removeClass( 'open' );
                $( 'body' ).removeClass( 'menu-open' );
                $( '.c-hamburger' ).removeClass('is-active');
            }
        });

        /*  [ Popup ]
        - - - - - - - - - - - - - - - - - - - - */
		$( '.button-popup' ).on( 'click', function(e) {
			e.preventDefault();
            $( '.popup' ).addClass('open');
        });
        $( '.close' ).on( 'click', function() {
            $( '.popup' ).removeClass('open');
        });

        /*  [ Header Fixed ]
        - - - - - - - - - - - - - - - - - - - - */
        if ($(window).width()<992) {
	        $(window).scroll(function(){
	        	if($(this).scrollTop()>0){
					$('#header').addClass('fixed');
			    }else{
					$('#header').removeClass('fixed');
			    }
	        });
        }

        /*  [ Sub Menu ]
    	- - - - - - - - - - - - - - - - - - - - */
        $( '.main-menu ul > li' ).on('click', function () {
			$( this ).find('.sub-menu').slideToggle();
		});

	    /*  [ Faq ]
        - - - - - - - - - - - - - - - - - - - - */
        $('.faq-desc').hide();
        $('.list-faq li a').on('click', function(e){
        	e.preventDefault();
            $('.list-faq li a').not(this).next().slideUp().parent().removeClass('open');
            $(this).next().slideToggle().parent().addClass('open');
        });

		/*  [ jQuery Countdown ]
        - - - - - - - - - - - - - - - - - - - - */
        var endDate = 'July 25, 2018';
        $( '.time ul' ).countdown({
            date: endDate,
            render: function(data) {
                $(this.el).html(
                    '<li><div class="time-item"><p>' + this.leadingZeros(data.days, 2) + '</p><span>Days</span></div></li>'
                    + '<li><div class="time-item"><p>' + this.leadingZeros(data.hours, 2) + '</p><span>Hours</span></div></li>'
                    + '<li><div class="time-item"><p>' + this.leadingZeros(data.min, 2) + '</p><span>Mins</span></div></li>'
                    + '<li><div class="time-item"><p>' + this.leadingZeros(data.sec, 2) + '</p><span>Seconds</span></div></li>'
                );
            }
        });
        setTimeout(function(){
        	$('.preloading').fadeOut();
		}, 3000); 
		$('#start-tag').magicSuggest({
        	placeholder: '',
        	maxEntryLength: 50,
    	});
	    $('.process-model li.pm-option').on('click', function (e){
	    	e.preventDefault();
			var tab_id = $(this).attr('data-tab');
			$('.process-model li.pm-option').removeClass('active');
			$('.tab-content .tab-pane').removeClass('active');
			$('.process-model li').removeClass();
			$(this).addClass('active');
			$("#"+tab_id).addClass('active');
			$(this).prevAll().addClass("visited");
		});
		$('.process-model li:nth-child(1)').removeClass('visited');
	    $('.pane-tab li').on('click', function (){
			var tab_id = $(this).attr('data-tab');
			$('.pane-tab li').removeClass('active');
			$('#story .pane-box').removeClass('active');
			$(this).addClass('active');
			$("#"+tab_id).addClass('active');
		});
		var toolbarOptions = [
            ['bold'],        // toggled buttons                       

            [{ 'size': [false, 'large', 'huge'] }],  // custom dropdown
            [ 'link' ],  
            [ 'image' ],   
            [ 'video' ],
            ['clean'],
        ];
		var quill = new Quill('#editor', {
    		modules: {
                toolbar: toolbarOptions,
            },
            formats: [
			    'bold',
			    'size',
			    'link',
			    'image',
			    'video',
			    'clean',
			  ],
		    theme: 'snow'
		});
		$('.create-perk').on('click', function (e){
			e.preventDefault();
			$(this).parent().fadeOut(0);
			$(this).parent().parent().find('.start-form').fadeIn();
		});
		$('.view-fees').on('click', function (e){
			e.preventDefault();
			$(this).parent().parent().find('.spopup-bg').fadeIn();
			$(this).parent().parent().find('.fees-popup').fadeIn();
		});
		$('.spopup-bg').on('click', function (e){
			e.preventDefault();
			$(this).fadeOut();
			$(this).parent().find('.fees-popup').fadeOut();
			$(this).parent().find('.item-popup').fadeOut();
		});
		$('.spopup-close').on('click', function (e){
			e.preventDefault();
			$(this).parent().parent().fadeOut();
			$(this).parent().parent().parent().find('.spopup-bg').fadeOut();
		});
		$('.item-cancel').on('click', function (e){
			e.preventDefault();
			$(this).parent().parent().fadeOut();
			$(this).parent().parent().parent().find('.spopup-bg').fadeOut();
		});
		$('.add-item').on('click', function (e){
			e.preventDefault();
			$(this).parent().find('.spopup-bg').fadeIn();
			$(this).parent().find('.item-popup').fadeIn();
		});
		$('.connect-fb').on('click', function (e){
			e.preventDefault();
			$(this).fadeOut(0);
			$(this).parent().find('.fb-content').fadeIn();
		});
		$('.fb-content a').on('click', function (e){
			e.preventDefault();
			$(this).parent().fadeOut(0);
			$(this).parent().parent().find('.connect-fb').fadeIn();
		});
		$('.add-reward').on('click', function (e){
			e.preventDefault();
			$("#import").append($("#itemform").html());
		});
		$("#import").bind("DOMSubtreeModified", function() {
			$('.reward-delete').on('click', function (e){
				e.preventDefault();
				$(this).parent().parent().fadeOut(0);	
			});
		});
	});
	$(window).on('load', function() {
		$( '.grid' ).each( function() {
	    	var $grid = $('.grid').isotope({
			  itemSelector: '.filterinteresting',
			  layoutMode: 'fitRows',
			  getSortData: {
			    name: '.name',
			    symbol: '.symbol',
			    number: '.number parseInt',
			    category: '[data-category]',
			    weight: function( itemElem ) {
			      var weight = $( itemElem ).find('.weight').text();
			      return parseFloat( weight.replace( /[\(\)]/g, '') );
			    }
			  }
			});

			// filter functions
			var filterFns = {
			  // show if number is greater than 50
			  numberGreaterThan50: function() {
			    var number = $(this).find('.number').text();
			    return parseInt( number, 10 ) > 50;
			  },
			  // show if name ends with -ium
			  ium: function() {
			    var name = $(this).find('.name').text();
			    return name.match( /ium$/ );
			  }
			};

			// bind filter button click
			$('.filter-theme').on( 'click', 'button', function() {
			  var filterValue = $( this ).attr('data-filter');
			  // use filterFn if matches value
			  filterValue = filterFns[ filterValue ] || filterValue;
			  $grid.isotope({ filter: filterValue });
			});



			// change is-checked class on buttons
			$('.campaign-tabs').each( function( i, buttonGroup ) {
			  var $buttonGroup = $( buttonGroup );
			  $buttonGroup.on( 'click', 'button', function() {
			    $buttonGroup.find('.is-checked').removeClass('is-checked');
			    $( this ).addClass('is-checked');
			  });
			});
	    });
	});
})(jQuery);
wow = new WOW(
  {
    animateClass: 'animated',
    offset:       100,
    callback:     function(box) {
      console.log("WOW: animating <" + box.tagName.toLowerCase() + ">")
    }
  }
);
wow.init();
