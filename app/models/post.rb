class Post < ApplicationRecord
  has_rich_text :content

  has_one_attached :cover
  has_one_attached :video
  has_many_attached :pictures

  belongs_to :user, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true

  validate :content_cannot_be_blank

  def content_cannot_be_blank
    if content.to_plain_text.blank?
      errors.add(:content, "Inhalt darf nicht leer sein!")
    end
  end

end
