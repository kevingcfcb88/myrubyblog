class PostsController < ApplicationController

  def index
    @search = Post.ransack(params[:q])
    @posts = @search.result(distinct: true)
  end

  def show
    @post = Post.find(params[:id])
    @user = AdminUser.all
  end

  def new
    @post = Post.new
    @category = Category.all
  end

  def create
    @post = Post.create(ad_params)
    if @post.save
      redirect_to posts_path, :notice => "Your post has been saved"
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(ad_params)
      redirect_to posts_path, :notice => "Your post has been updated"
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path, :notice => "Your post has been deleted"
    else
      render "edit"
    end
  end

  def ad_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
