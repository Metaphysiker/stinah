class OfferRequestMailer < ApplicationMailer

  def send_information_about_new_home_offer(email, home_offer)
    @home_offer = home_offer
    mail(to: email, subject: 'Neues Platz-Angebot')
  end

  def send_information_about_new_home_request(email, home_request)
    @home_request = home_request
    mail(to: email, subject: 'Neue Tierabgabe')
  end
end
