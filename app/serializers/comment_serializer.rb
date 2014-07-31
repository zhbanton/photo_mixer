class CommentSerializer < ActiveModel::Serializer

  include ActionView::Helpers::DateHelper

  attributes :id, :image_id, :user_email, :body, :score, :created_at_int, :time_ago, :upvote_link, :downvote_link, :profile_link, :username, :avatar_url

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

  def profile_link
    "/profile/#{object.user.id}"
  end

  def username
    "#{object.user.username}"
  end

  def avatar_url
    "#{object.user.avatar.url(:small_avatar)}"
  end

  def created_at_int
    "#{object.created_at.to_i}"
  end

end

