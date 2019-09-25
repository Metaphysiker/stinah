class Sponsorship < ApplicationRecord
  #after_create :set_last_check_of_payment

  belongs_to :user, optional: true
  belongs_to :animal

  #validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :sponsorships_ilike, ->(search_term) { where("firstname ILIKE ? OR lastname ILIKE ? OR email ILIKE ?", search_term, search_term, search_term) }

  def set_last_check_of_payment
    self.update(last_check_of_payment: Date.today)
  end

  def self.sponsorship_statuses
    ['without_sponsorship', 'with_sponsorship']
  end
end
