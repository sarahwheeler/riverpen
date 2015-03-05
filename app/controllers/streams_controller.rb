class StreamsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_stream, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @streams = Stream.all
    respond_with(@streams)
  end

  def show
    @stream = Stream.find(params[:id])
    @user = User.find(@stream.user_id)
    @posts = Post.find_by_stream_id(@stream.id)
    respond_with(@stream)
  end

  def new
    @stream = Stream.new
    @user = current_user
    respond_with(@stream)
  end

  def edit
    @stream = Stream.find(params[:id])
  end

  def create
    @stream = Stream.new(stream_params)
    @stream.save
    if @stream.save
      redirect_to stream_path(@stream)
    else
      render "new"
    end
  end

  def update
    @stream.update(stream_params)
    respond_with(@stream)
  end

  def destroy
    @stream.destroy
    respond_with(@stream)
  end

  def follow 
    follow = Follow.new(user_id: current_user.id, stream_id: @stream.id, 
                        stream_user_id: @stream.user_id)
    if follow.save
      respond_with(@stream)
    else
      respond_with(@stream)
    end
  end

  private
    def set_stream
      @stream = Stream.find(params[:id])
    end
    def stream_params
      params.require(:stream).permit([:category, :public, :user_id])
    end
end
