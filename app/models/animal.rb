class Animal < ApplicationRecord
  has_one_attached :cover
  has_rich_text :description

  has_many :sponsorships
  has_many :users, through: :sponsorships, dependent: :destroy

  scope :animals_ilike, ->(search_term) { where("name ILIKE ? OR description ILIKE ? OR race ILIKE ?", search_term, search_term, search_term) }

  def self.species
    ['pig', 'donkey', 'cow', 'sheep', 'chicken', 'horse', "goat", "rabbit", "other"] #cat dog
  end

  def self.genders
    ['male', 'female', 'whatever']
  end

  def self.castrated
    ['yes', 'no', 'whatever']
  end

  def self.sizes
    ['0 - 20', '20 - 40', '100 - 120', '120-130', '130-140']
  end

  def self.stables
    ["Offenstall", "Auslaufhaltung mit Boxe", "Auslaufboxe", "Anderes"]
  end

end
