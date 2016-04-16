class UsersController < ApplicationController
 before_action :authenticate_user!
  
  def myuser
    @users = User.all.where("id!=?", current_user.id)  
  end
end
