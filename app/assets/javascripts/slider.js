$(document).on('ready page:change', function() {
    var totalWidth = 0;
    //iterate over the slider-item divs and count the totoal width
    $(".slider-item").each(function() {
      totalWidth = totalWidth + $(this).outerWidth(true);// (true) includes the margin i.e. margin-right 20
    });


    var maxScrollPosition = totalWidth - $(".slider-window").outerWidth(); 
     $("p").append(totalWidth); 
     //$("p").append(maxScrollPosition); 

	function toSliderItem($targetItem) {
		if($targetItem.length) {
			var newPosition =  $targetItem.position().left;
			//$("p").append(newPosition); // for testing
				if(newPosition <= maxScrollPosition) {
					$targetItem.addClass("slider-item-active");
					$targetItem.siblings().removeClass("slider-item-active");
					$(".slider").animate ({
						left : - newPosition
					});
					if($(".slider-item:first").hasClass("slider-item-active")) {
						$("a.slider-controls-prev").hide();
					} else {
						$("a.slider-controls-prev").show();
					}
					if($(".slider-item:last").hasClass("slider-item-active")) {
						$("a.slider-controls-next").hide();
					} else {
						$("a.slider-controls-next").show();
					}
				} else {
					$(".slider").animate ({
						left : - maxScrollPosition
					});
				};
			};
		};

	//set width of slider div
	$(".slider").width(totalWidth);
	$(".slider-item:first").addClass("slider-item-active");

    //set controls
    $("a.slider-controls-prev").click(function() {
      	var $targetItem = $(".slider-item-active").prev();
      	toSliderItem($targetItem);
    });

    $("a.slider-controls-next").click(function() { 
        var $targetItem = $(".slider-item-active").next();
         toSliderItem($targetItem);
    });

    $(function() {
    $( "#sortable" ).sortable({ 
    	axis: "y",
    	handle: ".handle",
    	update: function() {
		    return $.post($(this).data('update-url'), $(this).sortable('serialize'));
		  }
    }); 

  });
});
