class ArticlesController < ApplicationController

  def index
    @articles = Article.all.with_attached_image
    # @top = Article.last
    # @news = Article.where(category: 'news').last
    # @business = Article.where(category: 'business').last
    # @ent = Article.where(category: 'entertainment').last
    # @tech = Article.where(category: 'tech').last
    # @sports = Article.where(category: 'sports').last
    # @op = Article.where(category: 'opinion').last
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      flash[:success] = 'Article created'
      redirect_to article_path(@article)
    else
      flash[:danger] = 'Error creating article'
    end
  end

  def show
    @article = Article.find(params[:id])
    @votes = @article.votes
  end

  def news
    @articles = Article.where(category: 'news').order(created_at: :desc)
  end

  def business
    @articles = Article.where(category: 'business').order(created_at: :desc)
  end

  def entertainment
    @articles = Article.where(category: 'entertainment').order(created_at: :desc)
  end

  def tech
    @articles = Article.where(category: 'tech').order(created_at: :desc)
  end

  def sports
    @articles = Article.where(category: 'sports').order(created_at: :desc)
  end

  def opinion
    @articles = Article.where(category: 'opinion').order(created_at: :desc)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
    flash[:success] = 'Article deleted'
  end

  private

  def article_params
    params.require(:article).permit(:title, :image, :text, :category)
  end
end
