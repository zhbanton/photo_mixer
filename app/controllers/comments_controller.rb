class CommentsController < ApplicationController

  before_action :get_image_and_comments
  before_action :authenticate_user!, only: :create

  def index
    @comment = Comment.new
  end

  def show
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.image = @image
    @comment.user = current_user
    if @comment.save
      redirect_to image_comments_path(@image), notice: 'comment submitted!'
    else
      flash.now[:alert] = @comment.errors.full_messages.join(', ')
      render :new
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def get_image_and_comments
    @image = Image.find(params[:image_id])
    @comments = Comment.all.order(score: :desc)
  end

end
