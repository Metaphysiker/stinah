class ChickenAdoptionsSearch
  def initialize(search_inputs)
    @search_term = search_inputs[:search_term] || nil
    @archived = search_inputs[:archived] || nil
  end

  def search
    query = ChickenAdoption.all

    #name, description, race
    unless @search_term.nil? || @search_term.blank?
      query = query.chicken_adoptions_ilike("%#{@search_term}%")
      #query = query. Animal.last.description.body.to_plain_text
    end

    if @archived.nil? || @archived.blank?
      query = query.unarchived
    else
      query = query.where(archived: @archived)
    end

    query.distinct
  end

end
