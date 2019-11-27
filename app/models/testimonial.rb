class Testimonial < ApplicationRecord
  has_one_attached :picture
  has_rich_text :content

  def self.categories
    ['interns', 'volunteers', 'workers', 'sponsors']
  end

end
