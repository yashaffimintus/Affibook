class LikesController < ApplicationController
  def index
    @likes = current_user.likes.all
  end 

  def create
    begin
        @like = current_user.likes.build(:post_id => params[:post_id])
        @like.user_id = current_user.id
      if @like.save
        flash[:notice] = "Post Liked!"
        redirect_to :back
      else
        flash[:error] = "Unable to Liked the Post!"
        redirect_to root_url
      end
    rescue Exception => e
      flash[:notice] = "Post Liked!"
      redirect_to :back
    end
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:id])
    @like.delete
    flash[:notice] = "Unliked a Post!"
    redirect_to relationships_path
  end
end
      
    
