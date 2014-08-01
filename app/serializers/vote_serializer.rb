class VoteSerializer < ActiveModel::Serializer
  attributes :id, :direction, :score_text, :score

  def score_text
    "| #{object.votable.score} points"
  end

  def score
    "#{object.votable.score}"
  end

end
