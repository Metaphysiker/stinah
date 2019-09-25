class HomeRequestsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :is_user_allowed?, except: [:new, :create]
  before_action :set_home_request, only: [:show, :edit, :update, :destroy, :archive]

  include ApplicationHelper

  # GET /home_requests
  # GET /home_requests.json
  def index
    @home_requests = HomeRequest.unarchived.order(:created_at)
  end

  # GET /home_requests/1
  # GET /home_requests/1.json
  def show
  end

  # GET /home_requests/new
  def new
    @home_request = HomeRequest.new
  end

  # GET /home_requests/1/edit
  def edit
  end

  # POST /home_requests
  # POST /home_requests.json
  def create
    @home_request = HomeRequest.new(home_request_params)

    respond_to do |format|
      if @home_request.save
        format.html { redirect_to @home_request, notice: 'Home request was successfully created.' }
        format.json { render :show, status: :created, location: @home_request }
      else
        format.html { render :new }
        format.json { render json: @home_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /home_requests/1
  # PATCH/PUT /home_requests/1.json
  def update
    respond_to do |format|
      if @home_request.update(home_request_params)
        format.html { redirect_to @home_request, notice: 'Home request was successfully updated.' }
        format.json { render :show, status: :ok, location: @home_request }
      else
        format.html { render :edit }
        format.json { render json: @home_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def compare
    @home_offer = HomeOffer.find(params[:home_offer_id])
    @home_request = HomeRequest.find(params[:home_request_id])
    @matches = RequestOfferComparison.new.find_matches_for_request(@home_request)
  end

  # DELETE /home_requests/1
  # DELETE /home_requests/1.json
  def destroy
    @home_request.destroy
    respond_to do |format|
      format.html { redirect_to home_requests_url, notice: 'Home request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def archive
    if @home_request.archived
      flash[:notice] = "Eintrag wurde de-archiviert!"
      @home_request.update(archived: false)
    else
      flash[:notice] = "Eintrag wurde archiviert!"
      @home_request.update(archived: true)
    end
    redirect_to home_request_path(@home_request)
  end

  def search_home_requests
    if params[:search_inputs].present?
      @search_inputs = OpenStruct.new(params[:search_inputs])
    else
      @search_inputs = OpenStruct.new()
    end
  @home_requests = HomeRequestsSearch.new(@search_inputs).search
  #@home_requests = @home_requests.page(params[:page])

  #@records = Search.new(model: klass, search_term: search_term, tag_list: tag_list, institutions: institutions, assigned_to_user_id: assigned_to_user_id, page: params[:page]).search
  #@search_inputs = params[:search_inputs]

    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_request
      @home_request = HomeRequest.find(params[:id])
    end

    def is_user_allowed?
      if !is_current_user_admin?
        #raise "not authorized"
        sign_out current_user
        flash[:notice] = "Sie sind nicht authorisiert!"
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_request_params
      params.require(:home_request).permit(:are_you_owner, :owner_firstname, :owner_lastname, :owner_street, :owner_plz, :owner_city, :owner_phone, :owner_email, :does_owner_agree_with_mediation, :do_you_own_authority_of_mediation, :messenger_firstname, :messenger_lastname, :messenger_street, :messenger_plz, :messenger_city, :messenger_phone, :messenger_mail, :killing_of_animal_intended, :killing_of_animal_scheduled, :date_of_killing, :species, :race, :age, :size, :color, :gender, :castrated, :current_location, :features, :stable_owner_firstname, :stable_owner_lastname, :stable_street, :stable_plz, :stable_city, :stable_phone, :how_was_animal_held, :how_was_animal_used, :reason_of_request, :is_animal_healthy, :privacy_statement, :rideable, pictures: [])
    end
end
