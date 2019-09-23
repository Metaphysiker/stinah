class Post < ApplicationRecord
  has_rich_text :content
  has_one_attached :cover
  has_one_attached :video
  has_many_attached :pictures
  belongs_to :user
end
