class PostsController < ApplicationController
 before_filter :authenticate_user!
  def index
  @posts = Post.all 
  end
 def show
  @post = Post.find(params[:id])
  end

  def new
   @post = Post.new
  end

  def edit
  @post = Post.find(params[:id])

  end
  
  def create 
  @post = current_user.posts.build(filtered_params)
  if @post.save
       flash[:success] = "Post created!"
    redirect_to @post
    else
      render action: "new" 
    end
  
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(filtered_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end
 
  def destroy
    @post = Post.find(params[:id])
    
    @post.destroy
    redirect_to posts_path
  end
  private
  def filtered_params
    params.require(:post).permit(:title,:user_id)
  end
end
