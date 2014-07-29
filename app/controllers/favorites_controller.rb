class FavoritesController < ApplicationController

  respond_to :json, :html

  def show
  end

  def create
    favorite = Favorite.new(favorite_params)
    favorite.user = current_user
    favorite.save
    respond_with(favorite)
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    respond_with(favorite)
  end

  private

  def favorite_params
    params.require(:favorite).permit(:image_id)
  end

end
