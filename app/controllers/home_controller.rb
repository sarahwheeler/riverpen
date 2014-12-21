class HomeController < ApplicationController
  respond_to :html

  def index
    @home = Home.all
    respond_with(@home)
  end


  private


end
