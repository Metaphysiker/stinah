class HomeRequest < ApplicationRecord
  validates :owner_firstname, :owner_lastname,
            :owner_street, :owner_plz, :owner_city, :owner_phone, :owner_email,
            :species, :race, :age, :size, :color,
            :gender, :castrated, :features, :stable_owner_firstname,
            :stable_owner_lastname, :stable_street, :stable_plz, :stable_city,
            :stable_phone, :how_was_animal_held, :how_was_animal_used,
            :reason_of_request, :is_animal_healthy, :privacy_statement, presence: true

  validates :messenger_firstname, :messenger_lastname,
            :messenger_plz, :messenger_street, :messenger_city,
            :messenger_phone, :messenger_mail, presence: true,  if: ->(o) { o.are_you_owner == false }

  #validates :killing_of_animal_scheduled, presence: true, if: ->(o) { o.killing_of_animal_intended == true }
  validates :date_of_killing, presence: true, if: ->(o) { o.killing_of_animal_scheduled == true }

  validates :age, :size, numericality: true

  validates :owner_email, :messenger_mail, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  has_many_attached :pictures

  scope :archived, -> { where(archived: true) }
  scope :unarchived, -> { where(archived: false) }

  before_save :update_search_field

  def messenger_or_owner
    string = ""

    unless owner_firstname.blank? || owner_lastname.blank?
      string = string + "#{owner_firstname} #{owner_lastname} "
    end

    unless messenger_firstname.blank? || messenger_lastname.blank?
      string = string + "/ #{messenger_firstname} #{messenger_lastname} "
    end

    string
  end

  scope :home_requests_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

  def update_search_field

    # HomeRequest.find_each(&:save)

    #killing_of_animal_intended
    date_of_killing_string = ""
    unless date_of_killing.blank?
      date_of_killing_string = I18n.l(date_of_killing)
    end

    self.search_field =
    [
      owner_firstname,
      owner_lastname,
      owner_street,
      owner_plz,
      owner_city,
      owner_phone,
      owner_email,
      messenger_firstname,
      messenger_lastname,
      messenger_street,
      messenger_plz,
      messenger_city,
      messenger_phone,
      messenger_mail,
      I18n.t(species, count: 1),
      race,
      color,
      features,
      date_of_killing_string,
      stable_owner_firstname,
      stable_owner_lastname,
      stable_street,
      stable_plz,
      stable_city,
      stable_phone,
      how_was_animal_held,
      how_was_animal_used,
      reason_of_request,
      is_animal_healthy
    ].compact.join(' ')

  end

end
