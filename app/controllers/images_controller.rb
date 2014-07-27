class ImagesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.new(image_params)
    if @image.save
      redirect_to root_path, notice: 'image submitted!'
    else
      flash.now[:alert] = @image.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def image_params
    params.require(:image).permit(:url, :caption)
  end

end
