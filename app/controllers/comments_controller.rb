class CommentsController < ApplicationController
  def create
  
      
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id 
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:body,:user_id,:post_id)
    end
end
