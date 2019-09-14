class SponsorshipMailer < ApplicationMailer
  def bank_information(email)
    mail(to: email, subject: 'Stinah - Patenschaft')
  end
end
