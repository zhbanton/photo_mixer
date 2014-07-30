class ProfileController < ApplicationController

  def show
    @user = User.find(params[:id])
    @uploaded_images = @user.uploaded_images
    @comments = @user.comments
    @favorite_images = @user.favorite_images
  end

end
