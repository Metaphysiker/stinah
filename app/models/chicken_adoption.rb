class ChickenAdoption < ApplicationRecord

  validates :firstname, :lastname, :street, :plz, :city,
            :phone, :email, :privacy_statement, :acceptance_statement, presence: true

  def self.adoption_of_a_rooster_possible
    ['yes', 'no']
  end

  def name
    "#{firstname} #{lastname}"
  end

end
