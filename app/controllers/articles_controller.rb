class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @user = current_user
    @article = @user.articles.build(article_params)
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

  def destroy
    @article.destroy
    flash[:success] = 'Article deleted'
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :category)
  end
end
