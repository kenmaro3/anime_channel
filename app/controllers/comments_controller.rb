class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'コメントを投稿しました。'
      redirect_to(root_path)
      
    else
      flash.now[:danger] = 'コメントの投稿に失敗しました。'
      render(root_path)
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'コメントを削除しました。'
    redirect_back(fallback_location: root_path)    
  end

  def show
  end

  def edit
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
 
end
