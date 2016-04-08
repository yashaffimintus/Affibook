class UsersController < ApplicationController
 before_action :authenticate_user!
  
  def myuser
    @users = User.all.where("id!=?", current_user.id)  
  end

  
  # def follow 
  #   byebug
   
  #   #@relationship = current_us.new(relationship_params)
  #   @posts = Post.all.where(:user_id => params[:id])
  #   redirect_to  new_relationship_path
    
  #  end
  # def unfollow
  #   @user = Relationship.find(params[:id]).followed
  #   current_user.unfollow(@user)
  #   redirect_to @user 
  # end
  

end
