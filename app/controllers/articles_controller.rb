# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]

  def new
    @article = Article.new
    # @article = current_user.articles.build
  end

  def edit
    @article = Article.find(params[:id])
  end

  def index
    # @articles = Article.includes(:user)
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
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
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :status)
  end

  def correct_user
    @article = Article.find_by(id: params[:id])
    redirect_to user_path(current_user) unless current_user == @article.user
  end
end
