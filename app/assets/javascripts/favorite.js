var favorite = function(event) {
  if ($(this).hasClass('favorite')) {
    $.ajax({
      url: '/users/' + $(this).data('user') + '/favorites/' + $(this).data('favorite'),
      type: 'DELETE'
    })
    .done(function(){
      $(this).removeClass('favorite');
    });
  }
  else {
    $.ajax({
      url: '/users/' + $(this).data('user') + '/favorites',
      type: 'POST',
      data: {},
      dataType: 'json'
    })
    .done(function(data) {
      $(this).addClass('favorite');
      $(this).data('favorite', 'data.id');
    });
  }
};
//if the favorite with the same user_id and image_id exists, destroy it otherwise create it
