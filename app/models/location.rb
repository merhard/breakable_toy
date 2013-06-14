class Location < ActiveRecord::Base
  has_many :courts
  # has_many :users

  attr_accessible :city, :state, :street_address, :zip
end
