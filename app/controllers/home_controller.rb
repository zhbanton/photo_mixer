class HomeController < ApplicationController

def index
    if params[:filter]
       @q = Image.search(params[:q])
       @images = Image.filterize(params[:filter])
    else
      @q = Image.search(params[:q])
      @images = Image.filterize('all_time')
    end
  end
end
