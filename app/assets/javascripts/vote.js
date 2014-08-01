var vote = function(event){
  $.ajax({
    url: $(this).attr('href'),
    type: 'PATCH',
    dataType: 'json',
    data: {vote: {direction: flipVote($(this).data('direction'))}}
  })
  .done(function(data) {
    $(this).data('direction', data.direction);
    $(this).removeClass().addClass(data.direction);
    $(this).first().siblings().first().text(data.score);
  }.bind(this));
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
