class AnimalsSearch
  def initialize(name: nil, description: nil, species: nil, race: nil, birth: nil)
    @name = name
    @description = description
    @species = species
    @race = race
    @birth = birth
  end

  def search
    query = Animal.all

    unless @name.nil? || @name.blank?
      query = query.search_records_ilike("%#{@name}%")
    end

    query.distinct
  end
end
