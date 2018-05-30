class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :likes]
  
  def show
    @user = current_user
    @post = current_user.posts.build
    @posts = current_user.posts.order("created_at DESC").page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to(@user)
      
    else
      flash.now[:danger] =  'ユーザの登録に失敗しました。'
      render(:new)
    end
  end
  
  def likes
    @user = current_user
    @favorite_posts = current_user.favorites.order("created_at DESC").page(params[:page])
    counts(@user)
  end  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
