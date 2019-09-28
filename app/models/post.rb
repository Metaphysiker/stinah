class Post < ApplicationRecord
  has_rich_text :content
  has_one_attached :cover
  has_one_attached :video
  has_many_attached :pictures
  belongs_to :user

  validates :title, :content, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged
end
