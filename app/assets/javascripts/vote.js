var vote = function(event){
  $.ajax({
    url: $('#upvote').attr('href'),
    type: 'PATCH',
    dataType: 'json',
    data: {vote: {direction: flipVote($('#upvote').data('direction'))}}
  })
  .done(function(data) {
    $('#upvote').data('direction', data.direction);
  });
  event.preventDefault();

};

var updateCommentVote = function(event){
  $.ajax({
    url: '/comments/:comment_id/vote',
    type: 'default GET (Other values: POST)',
    dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
    data: {param1: 'value1'},

  });
};

var flipVote = function(direction) {
 if (direction === "neutral") {
  return "up";
 }
 else if (direction === "up") {
  return "neutral";
 }
};
