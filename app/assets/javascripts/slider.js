
(function() {
    function CarouselReady(){
       var totalWidth = 0;
    //iterate over the slider-item divs and count the totoal width
    $(".slider-item").each(function() {
      totalWidth = totalWidth + $(this).outerWidth(true);// (true) includes the margin i.e. margin-right 20
    });

    var maxScrollPosition = totalWidth - $(".slider-window").outerWidth(); 

    function toSliderItem($targetItem) {
      if($targetItem.length) {
        var newPosition =  $targetItem.position().left;
        //$("p").append(newPosition); // for testing
          if(newPosition <= maxScrollPosition) {
            $targetItem.addClass("slider-item-active");
            $targetItem.siblings().removeClass("slider-item-active");
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
            $(".slider").animate ({
              left : - newPosition
            });

            
          } else {
            $(".slider").animate ({
              left : - maxScrollPosition
            });
          };
        };
      };

  //set width of slider div
  $(".slider").width(totalWidth);
  $("a.slider-controls-prev").hide();
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
    }
    
    $(document).on("ready", CarouselReady);
})();


(function() {
  function CarouselResize(){

    var totalWidth = 0;
    //iterate over the slider-item divs and count the totoal width
    $(".slider-item").each(function() {
      totalWidth = totalWidth + $(this).outerWidth(true);// (true) includes the margin i.e. margin-right 20
    });

    var maxScrollPosition = totalWidth - $(".slider-window").outerWidth(); 

      //set width of slider div
    $(".slider").width(totalWidth);
    $(".slider").css({ left: 0});
    $("a.slider-controls-prev").hide();
    $("a.slider-controls-next").show();
    $(".slider-item").removeClass("slider-item-active");
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
    }

    $(window).on("resize", CarouselResize);
})();