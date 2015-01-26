class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create, :destroy]
  before_action :set_post, only: [:show, :edit, :new, :update, :create, :destroy]


  respond_to :html

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new()
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_comment_path(@post, @comment), notice: 'Comment was successfully sent downriver.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.comments.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_user
      @user = User.find(current_user.id)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
