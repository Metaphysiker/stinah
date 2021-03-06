class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  attr_writer :login

 scope :with_role, ->(role) { left_outer_joins(:roles).where(roles: {role: role}) }

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validate :validate_username
  #after_create :create_sponsor_role

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  has_many :works
  has_many :posts

  has_many :sponsorships
  has_many :animals, through: :sponsorships, dependent: :destroy

  has_many :user_roles
  has_many :roles, through: :user_roles, dependent: :destroy

  def next_work
    #returns work with closest date
    message = "Noch kein Einsatz geplant."
    message = works.where("date >= ?", Date.today).order(:date).first.date unless works.where("date >= ?", Date.today).empty?
    message
  end

  def add_role_to_user(role)
    roles << Role.create(role: role) unless roles.where(role: role).exists?
  end

  def create_sponsor_role
    roles << Role.create(role: "sponsor")
  end

end
