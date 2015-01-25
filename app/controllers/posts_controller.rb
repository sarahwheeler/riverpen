class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_stream, only: [:new]
  before_action :set_user, only: [:show, :edit, :new, :update, :create, :destroy, :post]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path(@post), notice: 'Post was successfully sent downriver.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @stream = Stream.find(@post.stream_id)
    @post.destroy
    redirect_to stream_path(@stream.id) 
  end

  def float_post
    @stream_options = Stream.where(:user_id => current_user.id).map{ |s| [ s.category.capitalize, s.id ] }
    @post = Post.new
  end

  def streamless_create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path(@post), notice: 'Post was successfully sent downriver.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'post' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def set_current_stream
      @stream = Stream.find(params[:stream_id])
    end

    def set_user
      @user = User.find(current_user.id)
    end

    def post_params
      params.require(:post).permit(:id, :user_id, :stream_id, :title, :content)
    end
end
