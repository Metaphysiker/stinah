class Offerer < ApplicationRecord

  validates :firstname, :lastname, :street, :plz, :city,
            :phone, :email, :year, :experience,
            :motivation, :plans, presence: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :home_offers
  accepts_nested_attributes_for :home_offers

  def name
    "#{firstname} #{lastname}"
  end

  def update_search_field

    # HomeOffer.find_each(&:save)

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
      I18n.t(species, count: 1),
      race,
      stable,
      stable_alt,
      I18n.l(from_then_on)
      #I18n.l(created_at)
    ].compact.join(' ')

  end
end
