class AuthenticationController < ApplicationController
  def sign_in
    @user = User.new
  end

  def login
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
