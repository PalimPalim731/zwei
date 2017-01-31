class User < ActiveRecord::Base
  attr_accessible :email, :password, :name
  attr_accessor :password
  
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates_presence_of :name, :on => :create
end
