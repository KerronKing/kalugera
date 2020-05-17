class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @user = current_user
    @article = @user.articles.build(article_params)

    if @article.save
      flash[:success] = 'Article created'
    else
      flash[:danger] = 'Error creating article'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def news
    @article = Article.where("category = news").order(created_at: :desc)
  end

  def business
    @article = Article.where("category = business").order(created_at: :desc)
  end

  def entertainment
    @article = Article.where("category = entertainment").order(created_at: :desc)
  end

  def tech
    @article = Article.where("category = tech").order(created_at: :desc)
  end

  def sports
    @article = Article.where("category = sports").order(created_at: :desc)
  end

  def opinion
    @article = Article.where("category = opinion").order(created_at: :desc)
  end

  def destroy
    @article.destroy
    flash[:success] = 'Article deleted'
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :category)
  end
end
