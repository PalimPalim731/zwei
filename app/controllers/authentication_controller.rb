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
        # TODO - we will redirect to a logged in page
      else
        render action: 'signup'
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
      else
        render action: 'login'
      end
    end   
  end
  
  def logout
    session[:user_id] = nil
    redirect_to :login
  end
end

 
