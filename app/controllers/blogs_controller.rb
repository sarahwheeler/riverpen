class BlogsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_blog, only: [:follow, :show, :edit, :update, :destroy]

  respond_to :html

  def index
    @blogs = Blog.all
    respond_with(@blogs)
  end

  def show
    @blog = Blog.find(params[:id])
    @user = User.find(@blog.user_id)
    @posts = Post.where(published: true).find_by_blog_id(@blog.id)
    respond_with(@blog)
  end

  def new
    @blog = Blog.new
    @user = current_user
    respond_with(@blog)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.save
    if @blog.save
      redirect_to blog_path(@blog)
    else
      render "new"
    end
  end

  def update
    @blog.update(blog_params)
    respond_with(@blog)
  end

  def destroy
    @blog.destroy
    respond_with(@blog)
  end

  def follow 
    @user = current_user
    follow = Follow.new(follow_params)
    if follow.save
      respond_with(@blog)
    else
      respond_with(@blog)
    end
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end
    def blog_params
      params.require(:blog).permit([:category, :public, :user_id])
    end
end
