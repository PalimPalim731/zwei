class User < ActiveRecord::Base
  attr_accessor :email, :password, :name, :password
    
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates_presence_of :name, :on => :create
  
  def self.signup()
  end
  
  def self.login()
  end
end
