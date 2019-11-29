class Event < ApplicationRecord
  has_one_attached :cover
  has_rich_text :description

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.categories
    ['save_the_chicken']
  end

end
