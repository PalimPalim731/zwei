class AuthenticationController < ApplicationController
    
  def signup
    if request.get?
      puts "\n\n ^^^^ It's a get request. \n\n"
      @user = User.new
    else 
      puts "\n\n ^^^^ It's a post request. The params are: #{params.inspect} \n\n"
      @user = User.signup(params[:user]) || User.new
      if @user and @user.valid?
        session[:user_id] = @user.id
        flash[:notice] = 'Welcome!'
        redirect_to action: 'logged_in'
      end
    end
  end

  def login
    if request.get?
      puts "\n\n ^^^^ It's a get request. \n\n"
      @user = User.new
      
    elsif request.post?
      puts "\n\n ^^^^ It's a post request. \n\n"
      @user = User.authenticate(params[:user])

      if @user
        session[:user_id] = @user.id 
        redirect_to action: 'logged_in' 
      else
        render 'login'
      end
    end   
  end
  
  def logged_in
    if @logged_user.nil?
      @logged_user = User.find_by(id: session[:user_id])
    else
      @logged_user
    end
  end 
  
  
  def logged_user
    @logged_user ||= User.find_by(id: session[:user_id])
  end
  
  def logout
    session[:user_id] = nil
    redirect_to :login
  end
end

 
