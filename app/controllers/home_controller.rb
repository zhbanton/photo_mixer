class HomeController < ApplicationController

  def index
    if params[:filter]
      @images = Image.filterize(params[:filter])
    else
      @images = Image.filterize('all_time')
    end
    @images_of_interest = current_user.images_of_interest if user_signed_in?
  end

end
