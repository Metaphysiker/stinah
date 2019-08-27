class HomeOffersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_home_offer, only: [:show, :edit, :update, :destroy]
  before_action :is_user_allowed?, only: [:edit, :update, :destroy]

  include ApplicationHelper

  # GET /home_offers
  # GET /home_offers.json
  def index
    @home_offers = HomeOffer.all
  end

  # GET /home_offers/1
  # GET /home_offers/1.json
  def show
  end

  # GET /home_offers/new
  def new
    @home_offer = HomeOffer.new
  end

  # GET /home_offers/1/edit
  def edit
  end

  # POST /home_offers
  # POST /home_offers.json
  def create
    @home_offer = HomeOffer.new(home_offer_params)

    respond_to do |format|
      if @home_offer.save
        format.html { redirect_to @home_offer, notice: 'Home offer was successfully created.' }
        format.json { render :show, status: :created, location: @home_offer }
      else
        format.html { render :new }
        format.json { render json: @home_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /home_offers/1
  # PATCH/PUT /home_offers/1.json
  def update
    respond_to do |format|
      if @home_offer.update(home_offer_params)
        format.html { redirect_to @home_offer, notice: 'Home offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @home_offer }
      else
        format.html { render :edit }
        format.json { render json: @home_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_offers/1
  # DELETE /home_offers/1.json
  def destroy
    @home_offer.destroy
    respond_to do |format|
      format.html { redirect_to home_offers_url, notice: 'Home offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_offer
      @home_offer = HomeOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_offer_params
      params.require(:home_offer).permit(:firstname, :lastname, :street, :plz, :city, :phone, :email, :year, :experience, :motivation, :plans, :species, :age, :size, :gender, :castrated, :stable, :stable_alt, :privacy_statement, :from_then_on, :race)
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
