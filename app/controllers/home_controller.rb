class HomeController < ApplicationController

  def index
    @images = Image.all.order(:score)
  end

end
