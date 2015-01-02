class ProfilesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  respond_to :html

#  def index
#   @profiles = Profile.all
#   respond_with(@profiles)
#  end

  def show
    @user = User.find_by_id(@profile.user_id)
    respond_with(@profile)
  end

  def new
    @profile = Profile.new
    respond_with(@profile)
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
    respond_with(@profile)
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      #params[:profile]
      params.require(:profile).permit(:name, :age, :location, :website, :bio)
    end
end
