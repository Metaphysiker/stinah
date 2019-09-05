class HomeRequestsController < ApplicationController
  before_action :set_home_request, only: [:show, :edit, :update, :destroy]

  # GET /home_requests
  # GET /home_requests.json
  def index
    @home_requests = HomeRequest.all
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

  # DELETE /home_requests/1
  # DELETE /home_requests/1.json
  def destroy
    @home_request.destroy
    respond_to do |format|
      format.html { redirect_to home_requests_url, notice: 'Home request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_request
      @home_request = HomeRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_request_params
      params.require(:home_request).permit(:are_you_owner, :owner_firstname, :owner_lastname, :owner_street, :owner_plz, :owner_city, :owner_phone, :owner_email, :does_owner_agree_with_mediation, :do_you_own_authority_of_mediation, :messenger_firstname, :messenger_lastname, :messenger_street, :messenger_plz, :messenger_city, :messenger_phone, :messenger_mail, :killing_of_animal_intended, :killing_of_animal_scheduled, :date_of_killing, :species, :race, :age, :size, :color, :gender, :castrated, :current_location, :features, :stable_owner_firstname, :stable_owner_lastname, :stable_street, :stable_plz, :stable_city, :stable_phone, :how_was_animal_held, :how_was_animal_used, :reason_of_request, :is_animal_healthy, :privacy_statement, :rideable, pictures: [])
    end
end
