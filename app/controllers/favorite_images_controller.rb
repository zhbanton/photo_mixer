class FavoriteImagesController < ApplicationController
  before_action :authenticate_user!,
                :set_image

  def create
    if Favorite.create(favorited: @image, user: current_user)
      redirect_to @image
    else
      redirect to @image, flash[:alert] = 'Something went wrong...'
    end
  end

  def destroy
    Favorite.where(favorited_id: @image.id, user_id: current_user.id).first.destroy
    redirect_to @image
  end

  private

  def set_image
    @image = Image.find(params[:image_id] || params[:id])
  end

end
