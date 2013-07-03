class Location < ActiveRecord::Base
  has_many :courts
  has_many :users

  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state

  geocoded_by :address_from_components

  after_validation :geocode, if: :has_location?

  def address_from_components
    "#{self.street_address}, #{self.city}, #{self.state}"
  end

  def has_coordinates?
    self.latitude && self.longitude
  end

  def has_location?
    self.street_address && self.city && self.state
  end

  attr_accessible :city, :state, :street_address
end
