class AnimalsSearch
  def initialize(search_term: nil, species: nil, birth: nil)
    @search_term = search_term
    @name = name
    @species = species
    @birth = birth
  end

  def search
    query = Animal.all

    #name, description, race
    unless @search_term.nil? || @search_term.blank?
      query = query.animals_ilike("%#{@search_term}%")
    end

    unless @species.nil? || @species.blank?
      query = query.where(species: @species)
    end

    #unless @race.nil? || @race.blank?
    #  query = query.where(race: @race)
    #end

    query.distinct
  end
end
