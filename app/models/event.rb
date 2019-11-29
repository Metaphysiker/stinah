class Event < ApplicationRecord
  has_one_attached :cover
  has_rich_text :description

  def self.categories
    ['save_the_chicken']
  end

end
