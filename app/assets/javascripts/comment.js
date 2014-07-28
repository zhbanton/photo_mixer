$(document).ready(function() {
  $('#new_comment').submit(createComment);
});

var createComment = function(event) {
  $.ajax({
    url: 'http://localhost:3000' + $(this).attr('action'),
    type: 'POST',
    data: {comment: {body: $(this).children('textarea').val()}},
    dataType: 'json'
  })
  .done(function(data) {
    $('#new_comment textarea').val('');
    $('#comments').append(HandlebarsTemplates.comments(data));
  })
  .done(sortComments);
  event.preventDefault();
};

var sortComments = function() {
  var $comments = $('.comment');

  $comments.sort(function(a, b) {
    var an = a.getAttribute('data-score'),
        bn = b.getAttribute('data-score');

    if(an > bn) {
      return -1;
    }
    if(an < bn) {
      return 1;
    }
    return 0;
  });

  $comments.detach().appendTo('#comments');
};
