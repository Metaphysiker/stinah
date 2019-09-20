class AnimalsSearch

  def initialize(search_inputs)
  @search_term = search_inputs[:search_term] || nil
  @species = search_inputs[:species] || nil
  @gender = search_inputs[:gender] || nil

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

    unless @gender.nil? || @gender.blank?
      query = query.where(gender: @gender)
    end
    #unless @race.nil? || @race.blank?
    #  query = query.where(race: @race)
    #end

    query.distinct
  end
end
