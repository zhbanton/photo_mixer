class CommentsController < ApplicationController

  before_action :get_image_and_comments
  before_action :authenticate_user!, only: :create
  respond_to :html, :json

  def default_serializer_options
    {root: false}
  end

  def index
    @comment = Comment.new
    respond_with @comments
  end

  def show
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.image = @image
    @comment.user = current_user
    @comment.save
    respond_with(@comment)
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
