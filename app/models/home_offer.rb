class HomeOffer < ApplicationRecord
  validates :firstname, :lastname, :street, :plz, :city,
            :phone, :email, :year, :experience,
            :motivation, :plans, :species,
            :race, :gender, :castrated,
            :stable, :from_then_on, :privacy_statement, presence: true
end
