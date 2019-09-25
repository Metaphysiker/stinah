class Sponsorship < ApplicationRecord
  #after_create :set_last_check_of_payment

  belongs_to :user, optional: true
  belongs_to :animal

  #validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :sponsorships_ilike, ->(search_term) { joins(:animal).where("sponsorships.firstname ILIKE ? OR sponsorships.lastname ILIKE ? OR sponsorships.email ILIKE ? OR animals.name ILIKE ?", search_term, search_term, search_term, search_term) }

  def set_last_check_of_payment
    self.update(last_check_of_payment: Date.today)
  end

  def self.sponsorship_statuses
    ['without_sponsorship', 'with_sponsorship']
  end
end
