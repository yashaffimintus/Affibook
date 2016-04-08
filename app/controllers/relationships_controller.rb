class RelationshipsController < ApplicationController


  def index
    @relationships = current_user.relationships.all
  end

  def create
    begin
      @relationship = current_user.relationships.new(:followed_id => params[:followed_id])
      @relationship.follower_id = current_user.id  
      if @relationship.save 
        flash[:notice] = "Following"
        respond_to do |format|
          format.html { redirect_to :back }
          format.js
        end
        
      else
        flash[:error] = "Unable to follow"
        redirect_to root_path
      end
    rescue Exception => e
        flash[:notice] = "Following"
        redirect_to relationships_path

    end
  end
       
  def destroy
    @relationship = current_user.relationships.find_by(followed_id: params[:id])
    @relationship.delete
    flash[:notice] = "Removed relationship."
    respond_to do |format|
      format.html { redirect_to  :back }
      format.json
    end
  end

  private
  def relationship_params
    params.require(:relationship).permit(:user_id, :follower_id, :followed_id)
  end
end
        
     
          
        
