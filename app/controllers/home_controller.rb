class HomeController < ApplicationController

  def index
    @images = Image.all.order(score: :desc)
  end

end
