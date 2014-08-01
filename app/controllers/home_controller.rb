class HomeController < ApplicationController

  def index
    if params[:filter]
      @images = Image.filterize(params[:filter])
    else
      @images = Image.filterize('all_time')
    end
  end

end
