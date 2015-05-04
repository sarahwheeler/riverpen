class HomeController < ApplicationController
  respond_to :html

  def index
    @home = Home.all
    @post = Post.new
    unless current_user.nil?
      @blog_options = Blog.where(:user_id => current_user.id).map{ |s| [ s.category.capitalize, s.id ] }
    end
    
  end

  private


end
