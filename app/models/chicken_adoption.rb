class ChickenAdoption < ApplicationRecord

  validates :firstname, :lastname, :street, :plz, :city,
            :phone, :email, :privacy_statement, :acceptance_statement,
            :description_of_home, :number_of_chickens_for_adoption, :number_of_chickens_currently,
            :size_of_chicken_coop, :size_of_outdoor_area, :adoption_of_a_rooster_possible,  presence: true

  validates :number_of_chickens_for_adoption, numericality: { other_than: 0 }
  validates :size_of_outdoor_area, numericality: { other_than: 0 }

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :chicken_adoptions_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

  scope :archived, -> { where(archived: true) }
  scope :unarchived, -> { where(archived: false) }

  before_save :update_search_field

  def self.adoption_of_a_rooster_possible
    ['yes', 'no']
  end

  def name
    "#{firstname} #{lastname}"
  end

  def update_search_field

    # ChickenAdoption.find_each(&:save)

    self.search_field = [
      firstname,
      lastname,
      street,
      plz,
      city,
      phone,
      email,
      number_of_chickens_for_adoption,
      number_of_chickens_currently,
      description_of_home,
      size_of_chicken_coop,
      size_of_outdoor_area,
      adoption_of_a_rooster_possible,
      message
    ].compact.join(' ')

  end

end
