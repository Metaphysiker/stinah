class Offerer < ApplicationRecord

  validates :firstname, :lastname, :street, :plz, :city,
            :phone, :email, :year, :experience,
            :motivation, :plans, presence: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :home_offers
  accepts_nested_attributes_for :home_offers
end
