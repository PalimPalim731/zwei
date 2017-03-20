class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login, except: [:signup, :login, :logout]
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
  
  private
  
  def require_login
    unless logged_in
      flash[:error] = "You're not logged in"
      redirect_to login_url
    end
  end
   
    
end
