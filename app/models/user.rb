class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  has_many :sports_skill_levels
  has_many :skill_levels, through: :sports_skill_levels
  has_many :sports, through: :sports_skill_levels
  belongs_to :location

  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :login

  attr_accessor :login

  extend FriendlyId
  friendly_id :username, use: :slugged

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  before_create :create_username, :set_default_location

  def create_username
    email = self.email.split(/@/)
    potential_username = email[0]
    username_taken = User.where(username: potential_username).first
    n = 0
    while username_taken
      potential_username = email[0] + "#{n}"
      username_taken = User.where(username: potential_username).first
      n += 1
    end
    self.username = potential_username
    self.slug = potential_username
  end

  def set_default_location
    default_location = Court.first.location.dup
    self.location = default_location
  end

end
