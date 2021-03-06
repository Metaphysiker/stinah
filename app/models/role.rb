class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles, dependent: :destroy

  def self.roles
    ['admin', 'volunteer', 'external_professional']
  end
end
