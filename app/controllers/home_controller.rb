class HomeController < ApplicationController

def index
    if params[:filter]
       @image_search = Image.search(params[:q])
       @images = Image.filterize(params[:filter])
    else
      @image_search = Image.search(params[:q])
      @images = Image.filterize('all_time')
    end
  end
end
