class HomeRequestsSearch
  def initialize(search_inputs)
    @search_term = search_inputs[:search_term] || nil
    @archived = search_inputs[:archived] || nil
    @species = search_inputs[:species] || nil
    @gender = search_inputs[:gender] || nil
  end

  def search
    query = HomeRequest.all

    #name, description, race
    unless @search_term.nil? || @search_term.blank?
      query = query.home_requests_ilike("%#{@search_term}%")
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
