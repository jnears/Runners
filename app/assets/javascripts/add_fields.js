$(document).ready(function() {
jQuery(function() {
  $('form').on('click', '.remove_fields', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    return event.preventDefault();
  });
  return $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });
});
 
  // var current_id = 0;
 //  // $('a#add-another').click(function() {
 //  //   $('#slider-list li:first').clone().find('input').val('')
 //  //   .end().appendTo('#slider-list');
 //  // });

 





 //    var current_id = 1;
 //    $('a#add-another').click(function() {
 //        nextElement($('#slider-list-li'));
 //    })
    
 //    function nextElement(element){
 //        var newElement = element.clone();
 //        var id = current_id+1;
 //        current_id = id;
 //        if(id <10)id = "0"+id;
 //        newElement.attr("id",element.attr("id").split("_")[0]+"_"+id);
 //        var field = $('input', newElement).attr("id");
 //        $('input', newElement).attr("id", field.split("_")[0]+"_"+id );
 //        newElement.appendTo($("#slider-list"));
 //    }
 // // $('.delete-slider').live('click', function() {
 // //    if ($('#slider-list').length > 1)
 // //  $(this).parent().remove();
 // //    else
 // //  alert('You need at least one slider.')
 // //  });




});