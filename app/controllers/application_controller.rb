class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :all_categories
  helper_method :all_posts
  before_action  :site_search

  def all_categories
    @categories = Category.all
  end

  def all_posts
    @posts = Post.all
  end

  def site_search
    @search = Post.ransack(params[:q])
    @searchposts = @search.result(distinct: true)
  end
end
