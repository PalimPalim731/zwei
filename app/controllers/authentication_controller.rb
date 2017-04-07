class AuthenticationController < ApplicationController
  
  before_action :require_login, except: [:signup, :login]
  before_action :writesomestuffbefore
  after_action :writesomestuffafter
  
   
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
    puts "\n\n ^^^^ The params are: #{params.inspect} \n\n"
    
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
        @user = User.new
        render action: 'login'
      end
    end
  end

  
  def logged_in
  end 
    
  def logout
    session[:user_id] = nil
    redirect_to :login
  end
end

 
