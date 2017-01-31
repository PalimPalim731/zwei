class AuthenticationController < ApplicationController
  def sign_in
    @user = User.new
  end

  def login
    username_or_email = params[:user][:username]
    password = params[:user][:password]

    if username_or_email.rindex('@')
      email=username_or_email
      user = User.authenticate_by_email(email, password)
    else
      username=username_or_email
      user = User.authenticate_by_username(username, password)
    end

    if user
      redirect_to :root
    else
      render :action => "login"
    end
  end
  
  def new_user
  @user = User.new
  end

  def register
  @user = User.new(params[:user])

  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    flash[:notice] = 'Welcome.'
    redirect_to :root
  else
    render :action => "signup"
  end
  end
  
end
