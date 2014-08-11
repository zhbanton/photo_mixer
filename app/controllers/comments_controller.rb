class CommentsController < ApplicationController

  before_action :get_image_and_comments
  before_action :authenticate_user!, only: :create
  respond_to :html, :json

  def default_serializer_options
    {root: false}
  end

  def index
    @comment = Comment.new
    @favorite = current_user.get_favorite(@image) if user_signed_in?
  end

  def create
    comment = Comment.new(comment_params)
    comment.image = @image
    comment.user = current_user
    comment.save
    respond_with(comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def get_image_and_comments
    @image = Image.find(params[:image_id])
    gon.image_path = @image.image_path.url
    @comments = @image.comments.includes(:user).sort_by { |comment| [comment.score, comment.created_at] }.reverse
  end

end
