class PostsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @post = current_user.posts.build
    @post_image_url = params[:image_url]
    @post_url = params[:url]
  end
  
  def create
    @post  = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'レビューを投稿しました。'
      redirect_to(root_path)  
      
    else
      flash.now[:danger] = 'レビューの投稿に失敗しました。'  
      render(root_path)
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "レビューを削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.mentioned
    @comment = current_user.comments.build
    
####
    
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title,:comment,:laugh,:moved,:excit,:graphic,:plot,:recommend,:user_id)
  end
  
end
