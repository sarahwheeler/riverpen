
class ProfilesController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_user, only: [:edit, :update, :destroy]
  before_action :set_profile, only: [:edit, :update, :destroy]

  respond_to :html

  def edit
  end

  def update
    @profile.update_attributes(profile_params)
    redirect_to profile_path(@profile)
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
      params.require(:profile).permit(:name, :age, :location, 
          :website, :bio)
    end
end

