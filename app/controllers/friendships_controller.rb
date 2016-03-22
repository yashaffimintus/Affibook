class FriendshipsController < ApplicationController
  def index
  @users = User.all.where(:id => params[:id])  
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @friendship.friend_id = current_user.id
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to friendships_path(:id => params[:friend_id])
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end
end
