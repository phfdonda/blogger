# frozen_string_literal: true

class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :same_author_of_article, except: [:show, :index, :new]
  before_action :require_login, except: [:show, :index]

  def same_author_of_article
    @article = Article.find(params[:id])
    @article.author_id == current_user.id
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author_id = current_user.id
    @article.author_name = current_user.username
    @article.save
    flash.notice = "Article #{@article.title} was successfully created!"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article #{@article.title} was successfully deleted!"
    redirect_to articles_path(@articles)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash.notice = "Article #{@article.title} was successfully updated!"
      redirect_to @article
    else
      render 'edit'
    end
  end
end
