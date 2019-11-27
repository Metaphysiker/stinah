class Event < ApplicationRecord
  has_one_attached :cover

  def self.categories
    ['save_the_chicken']
  end

end
