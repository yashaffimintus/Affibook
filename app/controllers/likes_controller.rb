class LikesController < ApplicationController
  def index
    @likeables = Like.all
  end 

  def create
      @likeable = current_user.likes.build(:post_id => params[:post_id])
      @likeable.user_id = current_user.id
    if @likeable.save
      flash[:notice] = "Post Liked!"
      redirect_to  likes_path(:id => params[:post_id])
    else
      flash[:error] = "Unable to Liked the Post!"
      redirect_to root_url
    end
  end

  def destroy
    @likeable = current_user.likes.find(params[:id])
    @likeable.delete
    flash[:notice] = "Unliked a Post!"
    redirect_to likes_path
  end
end
