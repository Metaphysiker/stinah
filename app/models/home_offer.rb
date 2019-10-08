class HomeOffer < ApplicationRecord
  validates :firstname, :lastname, :street, :plz, :city,
            :phone, :email, :year, :experience,
            :motivation, :plans, :species,
            :race, :gender, :castrated,
            :stable, :from_then_on, :privacy_statement, presence: true

  validates :stable_alt, presence: true,  if: ->(o) { o.stable == "Anderes" }

  validates :min_age, presence: true,  if: ->(o) { o.age == false }
  validates :max_age, presence: true,  if: ->(o) { o.age == false }

  validates :min_size, presence: true,  if: ->(o) { o.size == false }
  validates :max_size, presence: true,  if: ->(o) { o.size == false }

  validates :min_age, :max_age, :min_size, :max_size, numericality: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  #validates :animal_0, :presence => true,:inclusion => { :in => COUNTRY_CODES.keys.map(&:to_s) }
  #validates :animal_0, inclusion: { in: %w(small medium large),
  #  message: "%{value} is not a valid size" }

  #accepts_nested_attributes_for :animal_0, reject_if: proc { |attributes| attributes['race'].blank? }

  before_save :update_search_field

  scope :archived, -> { where(archived: true) }
  scope :unarchived, -> { where(archived: false) }

  scope :home_offers_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

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
