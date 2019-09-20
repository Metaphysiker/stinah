class SponsorshipsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :activate_sponsorship, :deactivate_sponsorship]
  before_action :is_user_allowed?, only: [:index, :activate_sponsorship, :deactivate_sponsorship]
  before_action :set_sponsorship, only: [:activate_sponsorship, :deactivate_sponsorship, :check_payment]

  def my_sponsorships
    @sponsorships = current_user.sponsorships
  end

  def index
    #@sponsorships = Sponsorship.all
    @animals_with_sponsorships = Animal.joins(:sponsorships).distinct
  end

  def add_sponsorship
    #user = User.find(params[:user_id])
    #animal = Animal.find(params[:animal_id])
    #donation = params[:donation].to_d
    Sponsorship.create(sponsorship_params)
    redirect_back(fallback_location: root_path)
    #redirect_to my_sponsorships_path

    #mail to sponsor
    SponsorshipMailer.bank_information(sponsorship_params[:email]).deliver_now

    #mail to Admin
    SponsorshipMailer.bank_information("s.raess@me.com").deliver_later

    #mail to Claudia Steiger
    #SponsorshipMailer.bank_information("steiger@stinah.ch").deliver_now

  end

  def add_sponsorship_with_new_user

    Sponsorship.create(sponsorship_params)
    redirect_to my_sponsorships_path
  end

  def activate_sponsorship
    @sponsorship.update(active: true, last_check_of_payment: Date.today)
    redirect_back(fallback_location: root_path)
  end

  def deactivate_sponsorship
    @sponsorship.update(active: false, last_check_of_payment: Date.today)
    redirect_back(fallback_location: root_path)
  end

  def check_payment
    @sponsorship.update( last_check_of_payment: Date.today)
    redirect_back(fallback_location: root_path)
  end

  private

  def set_sponsorship
    @sponsorship = Sponsorship.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sponsorship_params
    params.require(:sponsorship).permit(:user_id, :animal_id, :donation, :public, :firstname, :lastname, :email)
  end

  def is_user_allowed?
    if !is_current_user_admin?
      #raise "not authorized"
      sign_out current_user
      flash[:notice] = "Sie sind nicht authorisiert!"
      redirect_to root_path
    end
  end
end
