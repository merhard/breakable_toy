class Sport < ActiveRecord::Base
  has_many :courts
  has_many :sports_skill_levels
  has_many :users, through: :sports_skill_levels
  has_many :taught_sports

  validates_presence_of :name

  attr_accessible :name
end
