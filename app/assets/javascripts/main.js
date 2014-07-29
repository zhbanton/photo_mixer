$(document).on("page:change", function() {
  $('#new-comment').submit(createComment);
  $('#favorite-button').click(favorite);
});
