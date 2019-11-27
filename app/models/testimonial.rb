class Testimonial < ApplicationRecord
  has_one_attached :picture
  has_rich_text :content
end
