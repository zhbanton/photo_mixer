$(document).ready( function() {
  $('#new-comment').submit(createComment);
  $('#favorite-button').click(favorite);
  $('.close').click(function(event){
    $(this).parent().remove();
    event.preventDefault();
  });
});

