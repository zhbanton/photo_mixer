var createComment = function(event) {
  $.ajax({
    url: $(this).attr('action'),
    type: 'POST',
    data: {comment: {body: $(this).children('textarea').val()}},
    dataType: 'json'
  })
  .done(function(data) {
    $('#new-comment textarea').val('');
    data.body = data.body.replace(/\n/g, '<br/>');
    $('#comments').append(HandlebarsTemplates.comments(data));
  })
  .done(sortComments);
  event.preventDefault();
};

var sortComments = function() {
  var $comments = $('.comment');

  $comments.sort(function(a, b) {
    var aScore = a.getAttribute('data-score'),
        bScore = b.getAttribute('data-score'),
        aCreatedAt = a.getAttribute('data-created-at'),
        bCreatedAt = b.getAttribute('data-created-at');

    if(aScore === bScore) {
      return bCreatedAt - aCreatedAt;
    }
    return bScore - aScore;
  });

  $('#comments').empty().append($comments);
};
