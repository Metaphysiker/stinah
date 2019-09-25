class HomeOffersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :is_user_allowed?, except: [:new, :create]
  before_action :set_home_offer, only: [:show, :edit, :update, :destroy, :archive]

  include ApplicationHelper

  # GET /home_offers
  # GET /home_offers.json
  def index
    @home_offers = HomeOffer.unarchived.order(:created_at)
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

  def matches_for_home_offer
    @home_offer = HomeOffer.last
    @home_request = HomeRequest.last
    #@matches_for_home_offer = find_matches_for_home_offer(@home_offer)
  end

  def compare
    @home_offer = HomeOffer.find(params[:home_offer_id])
    @home_request = HomeRequest.find(params[:home_request_id])
    #@matches_for_offer = RequestOfferComparison.new.find_matches_for_offer(@home_offer)
    @matches = RequestOfferComparison.new.find_matches_for_offer(@home_offer)
  end

  def archive
    if @home_offer.archived
      flash[:notice] = "Eintrag wurde de-archiviert!"
      @home_offer.update(archived: false)
    else
      flash[:notice] = "Eintrag wurde archiviert!"
      @home_offer.update(archived: true)
    end
    redirect_to home_offer_path(@home_offer)
  end

  def search_home_offers
    if params[:search_inputs].present?
      @search_inputs = OpenStruct.new(params[:search_inputs])
    else
      @search_inputs = OpenStruct.new()
    end
  @home_offers = HomeOffersSearch.new(@search_inputs).search
  #@home_offers = @home_offers.page(params[:page])

  #@records = Search.new(model: klass, search_term: search_term, tag_list: tag_list, institutions: institutions, assigned_to_user_id: assigned_to_user_id, page: params[:page]).search
  #@search_inputs = params[:search_inputs]

    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_offer
      @home_offer = HomeOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_offer_params
      params.require(:home_offer).permit(:firstname, :lastname, :street, :plz, :city, :phone, :email, :year, :experience, :motivation, :plans, :species, :age, :gender, :castrated, :stable, :stable_alt, :privacy_statement, :from_then_on, :race, :rideable, :min_age, :max_age, :min_size, :max_size)
    end

    def is_user_allowed?
      if !is_current_user_admin?
        #raise "not authorized"
        sign_out current_user
        flash[:notice] = "Sie sind nicht authorisiert!"
        redirect_to root_path
      end
    end

    def find_matches_for_home_offer(home_offer)
      HomeRequest.where('date_of_killing > ?', home_offer.from_then_on)
    end
end
