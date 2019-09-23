class AnimalsSearch

  def initialize(search_inputs)
    @search_term = search_inputs[:search_term] || nil
    @species = search_inputs[:species] || nil
    @gender = search_inputs[:gender] || nil
    @sponsorship_status = search_inputs[:sponsorship_status] || nil
    @health_status = search_inputs[:health_status] || nil
  end

  def search
    query = Animal.all

    #name, description, race
    unless @search_term.nil? || @search_term.blank?
      query = query.animals_ilike("%#{@search_term}%")
      #query = query. Animal.last.description.body.to_plain_text
    end

    unless @species.nil? || @species.blank?
      query = query.where(species: @species)
    end

    #if health_status is nil, only alive animals are shown
    if @health_status.nil? || @health_status.blank?
      query = query.alive
    else
      query = query.where(health_status: @health_status)
    end

    unless @gender.nil? || @gender.blank?
      query = query.where(gender: @gender)
    end

    unless @sponsorship_status.nil? || @sponsorship_status.blank?
      if @sponsorship_status == "without_sponsorship"
        query = query.left_outer_joins(:sponsorships).where( sponsorships: { id: nil } )
      elsif @sponsorship_status == "with_sponsorship"
        query = query.joins(:sponsorships)
      end
    end
    #unless @race.nil? || @race.blank?
    #  query = query.where(race: @race)
    #end

    query.distinct
  end
end
