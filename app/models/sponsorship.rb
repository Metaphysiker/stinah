class Sponsorship < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :animal
end
