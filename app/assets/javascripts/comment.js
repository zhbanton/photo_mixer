$(document).on("page:change", function() {
  $('#new-comment').submit(createComment);
});

var createComment = function(event) {
  $.ajax({
    url: 'http://localhost:3000' + $(this).attr('action'),
    type: 'POST',
    data: {comment: {body: $(this).children('textarea').val()}},
    dataType: 'json'
  })
  .done(function(data) {
    $('#new-comment textarea').val('');
    $('#comments').append(HandlebarsTemplates.comments(data));
  })
  .done(sortComments);
  event.preventDefault();
};

var sortComments = function() {
  var $comments = $('.comment');

  $comments.sort(function(a, b) {
    var aScore = a.getAttribute('data-score'),
        bScore = b.getAttribute('data-score');

    if(aScore > bScore) {
      return -1;
    }
    if(aScore < bScore) {
      return 1;
    }
    return 0;
  });

  $comments.detach().appendTo('#comments');
};
