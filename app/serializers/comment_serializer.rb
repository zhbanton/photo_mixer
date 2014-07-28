class CommentSerializer < ActiveModel::Serializer

  include ActionView::Helpers::DateHelper

  attributes :id, :image_id, :user_email, :body, :score, :time_ago, :upvote_link, :downvote_link

  def user_email
    "#{object.user.email}"
  end

  def upvote_link
    "/comments/#{object.id}/vote?direction=up"
  end

  def downvote_link
    "/comments/#{object.id}/vote?direction=down"
  end

  def time_ago
    "#{time_ago_in_words(object.created_at)}"
  end

end
