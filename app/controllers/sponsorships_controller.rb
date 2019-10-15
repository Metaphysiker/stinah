class SponsorshipsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :activate_sponsorship, :deactivate_sponsorship]
  before_action :is_user_allowed?, only: [:index, :activate_sponsorship, :deactivate_sponsorship, :check_payment, :search_sponsorships]
  before_action :set_sponsorship, only: [:activate_sponsorship, :deactivate_sponsorship, :check_payment, :destroy]

  include ApplicationHelper

  def my_sponsorships
    @sponsorships = current_user.sponsorships
  end

  def index
    @sponsorships = Sponsorship.all
    #@animals_with_sponsorships = Animal.joins(:sponsorships).distinct
  end

  def add_sponsorship
    @sponsorship = Sponsorship.new(sponsorship_params)

    respond_to do |format|
      if @sponsorship.save
        format.js
        #mail to sponsor
        SponsorshipMailer.send_bank_information_to_sponsor(sponsorship_params[:email]).deliver_now
        #mail to Admin
        SponsorshipMailer.send_information_about_new_sponsorship("s.raess@me.com", @sponsorship).deliver_now
        #mail to Claudia Steiger
        #SponsorshipMailer.send_information_about_new_sponsorship("steiger@stinah.ch").deliver_now
      else
        format.js
      end
    end
  end

  def add_sponsorship_without_sending_mail
    @sponsorship = Sponsorship.new(sponsorship_params)

    respond_to do |format|
      if @sponsorship.save
        flash[:notice] = "Patenschaft erstellt!"
        format.html { redirect_to sponsorships_path }
      else
        flash[:notice] = "Fehler! Patenschaft wurde nicht erstellt."
        format.html { redirect_to sponsorships_path }
      end
    end
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

  def search_sponsorships
    if params[:search_inputs].present?
      @search_inputs = OpenStruct.new(params[:search_inputs])
    else
      @search_inputs = OpenStruct.new()
    end

    @sponsorships = SponsorshipsSearch.new(@search_inputs).search

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @sponsorship.destroy
    respond_to do |format|
      format.html { redirect_to sponsorships_path, notice: 'Patenschaft entfernt!' }
    end
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
