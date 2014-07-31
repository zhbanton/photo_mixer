class ImagesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:tag]
      @images = Image.tagged_with(params[:tag])
    else
      @images = Image.all
    end
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.uploaded_images.new(image_params)
    if @image.save
      redirect_to edit_image_path(@image), notice: 'image submitted'
    else
      flash.now[:alert] = @image.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
    @comments = @image.comments.order(score: :desc)
    @comment = Comment.new
    @favorite = current_user.get_favorite(@image) if user_signed_in?
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to edit_image_path(@image), notice: 'image updated'
    else
      flash.now[:alert] = @image.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to @image, notice: "image deleted"
  end

  private

  def image_params
    params.require(:image).permit(:image_path, :caption, :tag_list)
  end

end
