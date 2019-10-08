class HomeOffer < ApplicationRecord
  validates :species,
            :race, :gender, :castrated,
            :stable, :from_then_on, :privacy_statement, presence: true

  validates :stable_alt, presence: true,  if: ->(o) { o.stable == "Anderes" }

  validates :min_age, presence: true,  if: ->(o) { o.age == false }
  validates :max_age, presence: true,  if: ->(o) { o.age == false }

  validates :min_size, presence: true,  if: ->(o) { o.size == false }
  validates :max_size, presence: true,  if: ->(o) { o.size == false }

  validates :min_age, :max_age, :min_size, :max_size, numericality: true

  before_save :update_search_field

  scope :archived, -> { where(archived: true) }
  scope :unarchived, -> { where(archived: false) }

  scope :home_offers_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

  belongs_to :offerer#, optional: true

  def update_search_field

    # HomeOffer.find_each(&:save)

    self.search_field =
    [
      I18n.t(species, count: 1),
      race,
      stable,
      stable_alt,
      I18n.l(from_then_on)
      #I18n.l(created_at)
    ].compact.join(' ')

  end

end
