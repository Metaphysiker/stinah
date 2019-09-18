class HomeRequest < ApplicationRecord
  has_many_attached :pictures

  scope :archived, -> { where(archived: true) }
  scope :unarchived, -> { where(archived: false) }

  def messenger_or_owner
    s = ""
    unless messenger_firstname.blank? || messenger_lastname.blank?
      s = "#{messenger_firstname} #{messenger_lastname}"
    else
      s = "#{owner_firstname} #{owner_lastname}"
    end
    s
  end
end
