class VotesController < ApplicationController
  before_action :find_article
  before_action :find_vote, only: [:destroy]

  def create
    @vote = @article.votes.create(user_id: current_user.id)
    redirect_to article_path(@article)
  end

  def destroy
    @vote.destroy
    redirect_to article_path(@article)
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_vote
    @vote = @article.votes.find(params[:id])
  end
end
