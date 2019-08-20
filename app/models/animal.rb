class Animal < ApplicationRecord
  has_one_attached :cover
  has_rich_text :description
end
