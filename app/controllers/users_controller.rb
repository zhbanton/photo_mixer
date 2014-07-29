class UserController < ApplicationController

  def uploaded_images
    @images = Image.where(user_id: params[:user_id])
  end

  def comments
  end

  def favorite_images
  end

end
