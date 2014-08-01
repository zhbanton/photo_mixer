var vote = function(event){
  $.ajax({
    url: $(this).attr('href'),
    type: 'PATCH',
    dataType: 'json',
    data: {vote: {direction: flipVote.bind(this)}}
  })
  .done(function(data) {
    $(this).data('direction', data.direction);
    $(this).removeClass('up down neutral').addClass(data.direction);
    $(this).siblings().last().data('direction', 'neutral');
    $(this).siblings().last().removeClass('up down neutral').addClass('neutral');
    $(this).first().siblings().first().text(data.score);
  }.bind(this));

  event.preventDefault();

};

var flipVote = function(direction) {
  if ($(this).data('direction') === "up" || $(this).data('direction') === "down") {
    return "neutral";
  }
  else {
    if ($(this).hasClass('upvote')) {
      return 'up';
    }
    else {
      return 'down';
    }
  }
};
