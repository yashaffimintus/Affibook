class FriendshipsController < ApplicationController
  def index  
  @friendships = current_user.friendships.all
  end

  def create
    begin
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id],approved: false)
      if  @friendship.save
        flash[:notice] = "Added friend."
        redirect_to friendships_path
      else
        flash[:error] = "Unable to add friend."
        redirect_to root_url
      end
    rescue Exception => e
        redirect_to friendships_path
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.update(approved: true)
      if @friendship.save
        redirect_to root_url, :notice => "Successfully confirmed friend!"
      else
        redirect_to root_url, :notice => "Sorry! Could not confirm friend!"
      end
    end

  def destroy
    @friendship = current_user.friendships.find_by(friend_id: params[:id])
    @friendship.delete
    flash[:notice] = "Removed friendship."
    redirect_to friendships_path
  end
end
      
    
    
