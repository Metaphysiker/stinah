class ChickenAdoptionsController < ApplicationController
  before_action :set_chicken_adoption, only: [:show, :edit, :update, :destroy]

  # GET /chicken_adoptions
  # GET /chicken_adoptions.json
  def index
    @chicken_adoptions = ChickenAdoption.all
  end

  # GET /chicken_adoptions/1
  # GET /chicken_adoptions/1.json
  def show
  end

  # GET /chicken_adoptions/new
  def new
    @chicken_adoption = ChickenAdoption.new
  end

  # GET /chicken_adoptions/1/edit
  def edit
  end

  # POST /chicken_adoptions
  # POST /chicken_adoptions.json
  def create
    @chicken_adoption = ChickenAdoption.new(chicken_adoption_params)

    respond_to do |format|
      if @chicken_adoption.save
        format.html { redirect_to @chicken_adoption, notice: 'Chicken adoption was successfully created.' }
        format.json { render :show, status: :created, location: @chicken_adoption }
      else
        format.html { render :new }
        format.json { render json: @chicken_adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chicken_adoptions/1
  # PATCH/PUT /chicken_adoptions/1.json
  def update
    respond_to do |format|
      if @chicken_adoption.update(chicken_adoption_params)
        format.html { redirect_to @chicken_adoption, notice: 'Chicken adoption was successfully updated.' }
        format.json { render :show, status: :ok, location: @chicken_adoption }
      else
        format.html { render :edit }
        format.json { render json: @chicken_adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chicken_adoptions/1
  # DELETE /chicken_adoptions/1.json
  def destroy
    @chicken_adoption.destroy
    respond_to do |format|
      format.html { redirect_to chicken_adoptions_url, notice: 'Chicken adoption was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chicken_adoption
      @chicken_adoption = ChickenAdoption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chicken_adoption_params
      params.require(:chicken_adoption).permit(:firstname, :lastname, :street, :plz, :city, :phone, :number_of_chickens_for_adoption, :number_of_chickens_currently, :description_of_home, :size_of_chicken_coop, :size_of_outdoor_area, :adoption_of_a_rooster_possible, :acceptance_statement, :privacy_statement, :message)
    end
end
