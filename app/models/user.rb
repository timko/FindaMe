class User < ActiveRecord::Base
  attr_accessible :email, :name, :pwd
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :pwd, :presence  => true
  has_one :checkin
  has_one :location, :through => :checkin
  
end
