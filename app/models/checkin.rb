class Checkin < ActiveRecord::Base
  attr_accessible :location_id, :user_id
  validates :location_id, :presence => true
  validates :user_id, :presence => true, :uniqueness => true
  belongs_to :user
  belongs_to :location
end
