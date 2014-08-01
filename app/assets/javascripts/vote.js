var vote = function(event){
  $.ajax({
    url: $('#upvote').attr('href'),
    type: 'PATCH',
    dataType: 'json',
    data: {vote: {direction: flipVote($('#upvote').data('direction'))}}
  })
  .done(function(data) {
    $('#upvote').data('direction', data.direction);
    $('#upvote').removeClass().addClass(data.direction);
  });
  event.preventDefault();

};

var flipVote = function(direction) {
 if (direction === "neutral" || direction === "down") {
  return "up";
 }
 else if (direction === "up") {
  return "neutral";
 }
};
