class HomeOffersSearch
  def initialize(search_inputs)
    @search_term = search_inputs[:search_term] || nil
    @species = search_inputs[:species] || nil
    @gender = search_inputs[:gender] || nil
  end

  def search
    query = HomeOffer.all

    #name, description, race
    unless @search_term.nil? || @search_term.blank?
      query = query.home_offers_ilike("%#{@search_term}%")
      #query = query. Animal.last.description.body.to_plain_text
    end

    query.distinct
  end

end
