class VoteSerializer < ActiveModel::Serializer
  attributes :id, :direction, :score

  def score
    "| #{object.votable.score} points"
  end

end
