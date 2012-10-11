class User < ActiveRecord::Base

  #using rails internal password digest
  has_secure_password

  #other stuff...
  attr_accessible :email, :name, :pwd
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence  => true
  has_one :checkin
  has_one :location, :through => :checkin
  
end
