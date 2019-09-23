class HomeRequest < ApplicationRecord
  has_many_attached :pictures

  scope :archived, -> { where(archived: true) }
  scope :unarchived, -> { where(archived: false) }

  before_save :update_search_field

  def messenger_or_owner
    s = ""
    unless messenger_firstname.blank? || messenger_lastname.blank?
      s = "#{messenger_firstname} #{messenger_lastname}"
    else
      s = "#{owner_firstname} #{owner_lastname}"
    end
    s
  end

  scope :home_requests_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

  def update_search_field

    # Animal.find_each(&:save)
    self.search_field =
    [
      owner_firstname,
      owner_lastname,
    ].compact.join(' ')

  end

end
