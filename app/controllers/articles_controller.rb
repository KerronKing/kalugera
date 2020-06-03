class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @top = Article.first
    @news = Article.where(category: 'news').first
    @business = Article.where(category: 'business').first
    @ent = Article.where(category: 'entertainment').first
    @tech = Article.where(category: 'tech').first
    @sports = Article.where(category: 'sports').first
    @op = Article.where(category: 'opinion').first
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @user = current_user
    @article = @user.articles.build(article_params)

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
