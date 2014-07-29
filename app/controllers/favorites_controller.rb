class FavoritesController < ApplicationController
  respond_to :json, :html

  def create
    favorite = Favorite.new
    favorite.image = Image.find(params[:image_id])
    favorite.user = current_user
    respond_with(favorite)
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    respond_with(favorite)
  end

end
