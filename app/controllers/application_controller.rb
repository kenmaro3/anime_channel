class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def counts(user)
    @count_posts = user.posts.count
    @count_likes = user.favorites.count
    
  end  
  
  def counts_comments(post)
    @count_comments = post.mentioned.count
  end
  
  helper_method :counts_comments
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
  	unless logged_in?
  		redirect_to(login_url)
  	end
  end
end
