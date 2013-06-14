class Court < ActiveRecord::Base
  belongs_to :sport
  belongs_to :location

  attr_accessible :location_id, :number_of, :sport_id
end
