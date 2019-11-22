class ChickenAdoptionMailer < ApplicationMailer
  def send_information_about_new_chicken_adoption(email, chicken_adoption)
    @chicken_adoption = chicken_adoption
    mail(to: email, subject: 'Neues Platz-Angebot für Hühner')
  end
end
