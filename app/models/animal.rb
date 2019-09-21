class Animal < ApplicationRecord
  has_one_attached :cover
  has_rich_text :description

  has_many :sponsorships
  has_many :users, through: :sponsorships, dependent: :destroy

  #scope :animals_ilike, ->(search_term) { where("name ILIKE ? OR description ILIKE ? OR race ILIKE ?", search_term, search_term, search_term) }
  scope :animals_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

  before_save :update_search_field

  def self.species
    ['pig', 'donkey', 'cow', 'sheep', 'chicken', 'horse', "goat", "rabbit", "cavy", "camelid", "other"] #cat dog
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

  def update_search_field

    # Animal.find_each(&:save)

    birth_string = ""
    unless birth.blank?
      birth_string = I18n.l(birth)
    end

    species_string = ""
    unless species.blank?
      species_string = species + " " + I18n.t(species)
    end

    gender_string = ""
    unless gender.blank?
      gender_string = gender + " " + I18n.t(gender)
    end

    self.search_field =
    [
      name,
      description.to_plain_text,
      species_string,
      race,
      #gender_string,
      birth_string,
      birth_ca
    ].compact.join(' ')
    puts search_field

  end

end
