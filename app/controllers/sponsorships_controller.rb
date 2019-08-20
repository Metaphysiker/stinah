class SponsorshipsController < ApplicationController

  def my_sponsorships
    @sponsorships = current_user.sponsorships
  end

  def add_sponsorship
    user = User.find(params[:user_id])
    animal = Animal.find(params[:animal_id])
    donation = params[:donation].to_d

    Sponsorship.create(user_id: user.id, animal_id: animal.id, donation: donation)
    redirect_to root_path
  end
end
