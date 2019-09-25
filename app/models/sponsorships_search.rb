class SponsorshipsSearch
  def initialize(search_inputs)
    @search_term = search_inputs[:search_term] || nil
    @active = search_inputs[:active] || nil
    @species = search_inputs[:species] || nil
    @gender = search_inputs[:gender] || nil
  end

  def search
    query = Sponsorship.all

    #name, description, race
    unless @search_term.nil? || @search_term.blank?
      query = query.sponsorships_ilike("%#{@search_term}%")
      #query = query. Animal.last.description.body.to_plain_text
    end

    unless @active.nil? || @active.blank?
      query = query.where(active: @active)
    end

    query.distinct
  end

end
