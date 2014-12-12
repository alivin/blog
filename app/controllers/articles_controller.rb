class ArticlesController < ApplicationController
  def index
    #@users = User.all
    #@user = User.find(1)
    @articles = Article.order(:title).page params[:page]
  end

  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def manage
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to manage_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :content, :avatar, :avatar_cache)
    end
end
