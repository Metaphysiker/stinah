class AnimalsSearch
  def initialize(search_term: nil, species: nil, race: nil, birth: nil)
    @search_term = search_term
    @species = species
    @race = race
    @birth = birth
  end

  def search
    query = Animal.all

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
