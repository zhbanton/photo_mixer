class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :direction, inclusion: { in: ['up', 'down', 'neutral'] }
  validates_uniqueness_of :user_id, scope: [:votable_id, :votable_type], message: "You can't vote on the same image twice- SORRY!"

  after_save :update_votable_score

  def update_votable_score
    upvotes = votable.votes.where(direction: 'up').count
    downvotes = votable.votes.where(direction: 'down').count
    votable.update!(score: upvotes - downvotes)
  end
end
