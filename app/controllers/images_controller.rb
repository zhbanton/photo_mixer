class ImagesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_image_and_authenticate_current_user, only: [:edit, :update, :destroy]

  def index
    @images = Image.all
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
    @comments = @image.comments.order(score: :desc)
    @comment = Comment.new
    @favorite = current_user.get_favorite(@image) if user_signed_in?
  end

  def update
    if @image.update(image_params)
      redirect_to edit_image_path(@image), notice: 'image updated'
    else
      flash.now[:alert] = @image.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @image.destroy
    redirect_to @image, notice: "image deleted"
  end

  private

  def image_params
    params.require(:image).permit(:image_path, :caption, :tag_list)
  end

  def get_image_and_authenticate_current_user
    @image = Image.find(params[:id])
    if @image.user != current_user
      redirect_to root_path, alert: "You do not have permission to edit other users' images"
    end
  end

end
