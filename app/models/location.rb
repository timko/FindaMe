class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name
  validates :latitude, :presence => true
  validates :longitude, :presence => true
  validates :name, :presence => true, :uniqueness => true
  has_many :checkins
  has_many :users, :through => :checkins
end
