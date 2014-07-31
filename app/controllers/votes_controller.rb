class VotesController < ApplicationController
  before_action :authenticate_user!

  respond_to :html, :json

  def update
    vote = Vote.find_or_initialize_by(user: current_user, votable: votable)
    vote.update!(vote_params)
    render json: vote
  end

  private

  def votable
    votable_id = params["#{params[:votable_type].underscore}_id"]
    params[:votable_type].constantize.find(votable_id)
  end

  def vote_params
    params.require(:vote).permit(:direction)
  end

end
