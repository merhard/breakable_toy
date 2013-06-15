class Location < ActiveRecord::Base
  has_many :courts
  # has_many :users

  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  attr_accessible :city, :state, :street_address, :zip
end
