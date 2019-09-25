class SponsorshipMailer < ApplicationMailer
  def send_bank_information_to_sponsor(email)
    mail(to: email, subject: 'Stinah - Patenschaft')
  end

  def send_information_about_new_sponsorship(email, sponsorship)
    @sponsorship = sponsorship
    mail(to: email, subject: 'Neue Patenschaft')
  end
end
