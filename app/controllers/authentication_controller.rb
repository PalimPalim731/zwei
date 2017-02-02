class AuthenticationController < ApplicationController
  def signup
    @user = User.new
  end

  def login
    if request.get?
      puts "\n\n ^^^^ It's a get request. \n\n"
      @user = User.new
      
    elsif request.post?
      puts "\n\n ^^^^ It's a post request. \n\n"
      name_or_email = params[:user][:name]
      password = params[:user][:password]

      if name_or_email.rindex('@')
        email=name_or_email
        user = User.authenticate_by_email(email, password)
      else
        name=name_or_email
        user = User.authenticate_by_username(name, password)
      end

      if user
        redirect_to :action => "signup"
      else
        render :action => "login"
      end
   end   
end
end

 
