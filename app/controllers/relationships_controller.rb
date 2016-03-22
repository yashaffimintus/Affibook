class RelationshipsController < ApplicationController


def index
  #@relationships = Relationship.all
  @posts = Post.all.where(:user_id => params[:id])
  @users = User.all.where(:id => params[:id]) 
end 
def create
    @relationship = current_user.relationships.build(:followed_id =>
    params[:followed_id])
    @relationship.follower_id = current_user.id
  if @relationship.save
    flash[:notice] = "Added friend."
    redirect_to  relationships_path(:id => params[:followed_id])
  else
    flash[:error] = "Unable to add friend."
    redirect_to root_url
  end
end

def destroy
  @relationship = current_user.relationships.find(params[:id])
  @relationship.destroy
  flash[:notice] = "Removed relationship."

end


  
end
