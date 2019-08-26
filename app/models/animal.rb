class Animal < ApplicationRecord
  has_one_attached :cover
  has_rich_text :description

  has_many :sponsorships
  has_many :users, through: :sponsorships, dependent: :destroy

  def self.species
    ['pig', 'donkey', 'cow', 'sheep', 'chicken', 'horse', 'dog', 'cat']
  end

end
