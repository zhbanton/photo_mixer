$(document).ready( function() {
  $('#new-comment').submit(createComment);
  $('#favorite-button').click(favorite);
  $('.close').click(function(event){
    $(this).parent().remove();
    event.preventDefault();
  });
  $('body').on('click', '.upvote', vote);
  $('body').on('click', '.downvote', vote);

});
