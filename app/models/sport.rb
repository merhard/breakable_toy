class Sport < ActiveRecord::Base
  has_many :courts

  validates_presence_of :name

  attr_accessible :name
end
