class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception
   
   include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_microposts = user.microposts.count
    @microposts = @user.microposts.order('created_at DESC').page(params[:page])
    counts(@user)
  end
end
