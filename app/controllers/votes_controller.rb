class VotesController < ApplicationController
  def new
    @vote = current_user.votes.build
  end

  def create
    @vote = current_user.votes.build(vote_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @vote.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :article_id)
  end
end
