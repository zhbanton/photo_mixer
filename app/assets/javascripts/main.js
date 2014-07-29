$(document).on("page:change", function() {
  $('#new-comment').submit(createComment);
  $('#favorite-button').click(favorite);
  $('.close').click(function(event){
    $(this).parent().remove();
    event.preventDefault();
  });

});

