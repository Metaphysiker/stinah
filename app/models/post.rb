class Post < ApplicationRecord
  has_rich_text :content
  has_one_attached :cover
  has_one_attached :video
  belongs_to :user
end
