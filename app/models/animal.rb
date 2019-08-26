class Animal < ApplicationRecord
  has_one_attached :cover
  has_rich_text :description

  has_many :sponsorships
  has_many :users, through: :sponsorships, dependent: :destroy

  scope :animals_ilike, ->(search_term) { where("name ILIKE ? OR description ILIKE ? OR race ILIKE ?", search_term, search_term, search_term) }

  def self.species
    ['pig', 'donkey', 'cow', 'sheep', 'chicken', 'horse', 'dog', 'cat']
  end

end
