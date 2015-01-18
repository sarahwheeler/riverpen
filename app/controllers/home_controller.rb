class HomeController < ApplicationController
  respond_to :html

  def index
    @home = Home.all
    @post = Post.new
    @stream_options = Stream.where(:user_id => current_user.id).map{ |s| [ s.category.capitalize, s.id ] }
    respond_with(@home)
  end

  def create
  end	

  private


end
