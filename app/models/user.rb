class User < ActiveRecord::Base
  require 'digest/sha1'
  validates :name, presence: { message: "Name name is required" }
  validates :email, presence: { message: "Email name is required" },
                    uniqueness: { case_sensitive: false, message: "This email is already registered" }
  validates :password, presence: { message: "Password name required" }
  attr_accessor :password
  before_save :encrypt_password  
  
  # TODO - we will add later a check to make sure an email can only register once
  
  def self.signup(params)
  	puts "\n\n ^^^^ We will signup the user with: Name: #{params[:name]}; email: #{params[:email]} and password: #{params[:password]} \n\n"
  	user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if user.save
      puts "\n\n ^^^^ User signed up successfully: #{user.inspect} \n\n"
    else
      puts "\n\n ^^^^ Errors while saving: #{user.errors.inspect} \n\n"
    end
  end

  def self.authenticate(params)
  	puts "\n\n ^^^^ We will authenticate the user with the email: #{params[:email]} and password: #{params[:password]} \n\n"
    
    if params[:email] and !params[:email].blank?
      user = self.find_by(email: params[:email])

      # TODO - after we store the encrypted password, we will check that the stored encrypted password 
      
      if user and user.hashed_password == Digest::SHA1.hexdigest(params[:password])
        puts "\n\n ^^^^ We've found the user with email #{params[:email]} and the typed password is correct. \n\n"
        return user
      end
    end
    
    puts "\n\n ^^^^ We have not found the requested user, we'll just return a blank user \n\n"
    self.new
  end
  
  private
  
  def encrypt_password
    unless self.password.blank?
      self.hashed_password= Digest::SHA1.hexdigest(self.password)
    end
  end

end
