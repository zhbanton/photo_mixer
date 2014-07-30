class ImagesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  def index
    @images = Image.all
  end

  def show
    @images = Image.where(user_id: params[:user_id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.uploaded_images.new(image_params)
    if @image.save
      redirect_to root_path, notice: 'image submitted!'
    else
      flash.now[:alert] = @image.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to @image, notice: "Image deleted!"
  end

  private

  def image_params
    params.require(:image).permit(:image_path, :caption, :tag_list)
  end

end
