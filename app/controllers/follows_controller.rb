class FollowsController < ApplicationController
  before_action :set_user
  before_action :set_follow, only: [:edit, :destroy]

  def index
    @follows = @user.follows
  end

  def new
    @follow = @user.follows.build
  end

  def create
    @follow = @user.follows.build(follow_params)
    respond_to do |format|
      if @follow.save
        format.html { redirect_to @user, notice: 'You are now following this book!' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @follow = @user.follows.find(params[:id])
  end

  def destroy
    @follow = @user.follows.find(params[:id])
    @follow.destroy
    respond_to do |format|
      format.html { redirect_to email_preferences_path }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = @user.follows.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    def set_blog
      @blog = Blog.find_by_id(params[:blog_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def follow_params
      params.require(:follow).permit(:user_id, :blog_id, :blog_user_id)
    end
end