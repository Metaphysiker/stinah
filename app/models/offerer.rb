class Offerer < ApplicationRecord

  validates :firstname, :lastname, :street, :plz, :city,
            :phone, :email, :year, :experience,
            :motivation, :plans, presence: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :home_offers
  accepts_nested_attributes_for :home_offers, reject_if: :all_blank

  scope :offerers_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

  def name
    "#{firstname} #{lastname}"
  end

    before_save :update_search_field

  def update_search_field

    # Offerer.find_each(&:save)

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
      plans
    ].compact.join(' ')

  end
end
