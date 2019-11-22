class ChickenAdoption < ApplicationRecord

  validates :firstname, :lastname, :street, :plz, :city,
            :phone, :email, :privacy_statement, :acceptance_statement,
            :description_of_home, :number_of_chickens_for_adoption, :number_of_chickens_currently,
            :size_of_chicken_coop, :size_of_outdoor_area, :adoption_of_a_rooster_possible,  presence: true

  validates :number_of_chickens_for_adoption, numericality: { other_than: 0 }

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def self.adoption_of_a_rooster_possible
    ['yes', 'no']
  end

  def name
    "#{firstname} #{lastname}"
  end

end
