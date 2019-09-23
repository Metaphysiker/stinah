class HomeOffer < ApplicationRecord
  validates :firstname, :lastname, :street, :plz, :city,
            :phone, :email, :year, :experience,
            :motivation, :plans, :species,
            :race, :gender, :castrated,
            :stable, :from_then_on, :privacy_statement, presence: true

  before_save :update_search_field

  scope :archived, -> { where(archived: true) }
  scope :unarchived, -> { where(archived: false) }

    scope :home_offers_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

  def name
    "#{firstname} #{lastname}"
  end

  def update_search_field

    # Animal.find_each(&:save)

    self.search_field =
    [
      firstname,
      lastname,
      street,
      plz,
      city,
      phone,
      email,
      year,
      experience,
      motivation,
      plans,
      I18n.t(species),
      race,
      stable,
      stable_alt,
      I18n.l(from_then_on)
    ].compact.join(' ')

  end

end
