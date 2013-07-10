class Court < ActiveRecord::Base
  belongs_to :sport
  belongs_to :location

  reverse_geocoded_by "locations.latitude", "locations.longitude"

  validates_presence_of :number_of
  validates_presence_of :sport_id
  validates_presence_of :location_id

  attr_accessible :location_id, :number_of, :sport_id
end
