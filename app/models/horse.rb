class Horse < ApplicationRecord
  has_one_attached :portrait
  has_rich_text :description
end
