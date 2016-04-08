class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def index 
  end 
   
  def show
    @profile = Profile.find_by(params[:id]) 
  end

  def dashboard
  end

  def new
    @profile = Profile.new
  end
  
  def create
       @profile = current_user.build_profile(profile_params)
    if @profile.save
       redirect_to users_user_id_profiles_id_path(:user_id => current_user.id,:id => Profile.last)
    else
      render 'new'
    end
  end
       
 
  private
  def profile_params
    params.require(:profile).permit(:user_id, :status, :gender, :address, :dob)
  end
end


