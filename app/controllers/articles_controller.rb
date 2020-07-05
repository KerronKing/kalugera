class ArticlesController < ApplicationController
  impressionist :actions => [:show]

  def index
    @articles = Article.with_attached_image.all
    @top = @articles[0]

    @news = []
    @business = []
    @ent = []
    @tech = []
    @sports = []
    @op = []

    @articles.each do |article|
      @news << article if article&.category == 'news'
      @business << article if article&.category == 'business'
      @ent << article if article&.category == 'entertainment'
      @tech << article if article&.category == 'tech'
      @sports << article if article&.category == 'sports'
      @op << article if article&.category == 'opinion'
    end
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
    impressionist(@article)
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
