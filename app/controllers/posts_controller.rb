class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_stream, only: [:show, :edit, :new, :update, :create, :destroy]
  before_action :set_user, only: [:show, :edit, :new, :update, :create, :destroy, :post]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    @post = Post.new(:user_id => @user.id, :stream_id => @stream.id)
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = @stream.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to stream_post_path(@stream, @post), notice: 'Post was successfully sent downriver.' }
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
    @post = @stream.posts.find(params[:id])
    @post.destroy
    respond_with(@post)
  end

  def post
    @post = Post.new(:user_id => @user.id)
    respond_with(@post)
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
