class SponsorshipsController < ApplicationController

  def my_sponsorships
    @sponsorships = current_user.sponsorships
  end

  def index
    @sponsorships = Sponsorship.all
  end

  def add_sponsorship
    #user = User.find(params[:user_id])
    #animal = Animal.find(params[:animal_id])
    #donation = params[:donation].to_d
    Sponsorship.create(sponsorship_params)
    redirect_back(fallback_location: root_path)
    #redirect_to my_sponsorships_path

    SponsorshipMailer.bank_information("s.raess@me.com").deliver_now
  end

  def add_sponsorship_with_new_user

    Sponsorship.create(sponsorship_params)
    redirect_to my_sponsorships_path
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def sponsorship_params
    params.require(:sponsorship).permit(:user_id, :animal_id, :donation, :public)
  end
end
