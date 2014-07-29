var favorite = function(event) {
  if ($('#favorite-button').hasClass('favorite')) {
    $.ajax({
      url: '/favorites/' + $(this).data('favorite'),
      type: 'DELETE'
    })
    .done(function(data){
      $('#favorite-button').removeClass('favorite');
    });
  }
  else {
    $.ajax({
      url: '/favorites',
      type: 'POST',
      data: {favorite: {image_id: $(this).data('image')}},
      dataType: 'json'
    })
    .done(function(data) {
      $('#favorite-button').addClass('favorite');
      $('#favorite-button').data('favorite', data.id);
    });
    event.preventDefault();
  }
};
//if the favorite with the same user_id and image_id exists, destroy it otherwise create it
