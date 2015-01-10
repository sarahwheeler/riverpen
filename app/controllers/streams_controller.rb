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
    respond_with(@stream)
  end

  def new
    @stream = Stream.new
    respond_with(@stream)
  end

  def edit
  end

  def create
    @stream = Stream.new(stream_params)
    @stream.save
    respond_with(@stream)
  end

  def update
    @stream.update(stream_params)
    respond_with(@stream)
  end

  def destroy
    @stream.destroy
    respond_with(@stream)
  end

  private
    def set_stream
      @stream = Stream.find(params[:id])
    end

    def stream_params
      params[:stream]
    end
end
