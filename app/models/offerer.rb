class Offerer < ApplicationRecord
  has_many :home_offers
  accepts_nested_attributes_for :home_offers
end
