class ArticlesController < ApplicationController
  before_action :find_task, only: [:show, :edit, :create, :destroy]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    return_to article_path(@article)
  end

  def edit; end

  def update
    @article.update(article_params)
    return_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_task
    @article = Article.find(params[:id])
  end
end
