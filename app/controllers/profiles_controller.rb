class ProfilesController < ApplicationController
before_action :authenticate_user!

def show
#@profile = Profile.find(params[:id]) 
end

def dashboard
end

def new
@profile = Profile.new
end
  
def create

  @profile = current_user.build_profile(profile_params)
  if @profile.save
    redirect_to  user_profiles_path
  else
    render 'new'
  end
end
 
private
  def profile_params
    params.require(:profile).permit(:user_id,:status, :gender,:address,:dob)
  end
end
