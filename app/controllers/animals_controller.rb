class AnimalsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_animal, only: [:show, :edit, :update, :destroy]
  before_action :is_user_allowed?, only: [:new, :edit, :update, :destroy]

  include ApplicationHelper

  # GET /animals
  # GET /animals.json
  def index
    #@animals = Animal.all
    if params[:search_inputs].present?
      @search_inputs = OpenStruct.new(params[:search_inputs])
    else
      @search_inputs = OpenStruct.new()
    end
  @animals = AnimalsSearch.new(@search_inputs).search
  @animals = @animals.page(params[:page])

    set_meta_tags title: 'Unsere Tiere', reverse: true,
              description: 'Alle Tiere von STINAH im Überblick!'
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
  end

  # GET /animals/new
  def new
    @animal = Animal.new
  end

  # GET /animals/1/edit
  def edit
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(animal_params)

    respond_to do |format|
      if @animal.save
        format.html { redirect_to @animal, notice: 'Animal was successfully created.' }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to @animal, notice: 'Animal was successfully updated.' }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to animals_url, notice: 'Animal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def search_animals
      if params[:search_inputs].present?
        @search_inputs = OpenStruct.new(params[:search_inputs])
      else
        @search_inputs = OpenStruct.new()
      end
    @animals = AnimalsSearch.new(@search_inputs).search
    @animals = @animals.page(params[:page])

    #@records = Search.new(model: klass, search_term: search_term, tag_list: tag_list, institutions: institutions, assigned_to_user_id: assigned_to_user_id, page: params[:page]).search
    #@search_inputs = params[:search_inputs]

      respond_to do |format|
        format.js
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_params
      params.require(:animal).permit(:name, :description, :species, :race, :birth, :cover, :gender, :size, :birth_ca, :health_status, pictures: [])
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
