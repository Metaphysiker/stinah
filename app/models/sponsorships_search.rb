class SponsorshipsSearch
  def initialize(search_inputs)
    @search_term = search_inputs[:search_term] || nil
    @active = search_inputs[:active] || nil
    @species = search_inputs[:species] || nil
    @gender = search_inputs[:gender] || nil
    @control = search_inputs[:control] || nil
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

    unless @control.nil? || @control.blank?
      #sponsorship.last_check_of_payment + 13.weeks < Date.today

      if ActiveModel::Type::Boolean.new.cast(@control)
        nil_check_ids = Sponsorship.where(last_check_of_payment: nil).pluck(:id)
        need_check_ids = Sponsorship.where("last_check_of_payment < ?", Date.today - 13.weeks)

        query = query.where(id: nil_check_ids + need_check_ids)
      else
        query = query.where("last_check_of_payment > ?", Date.today - 13.weeks)
      end
    end

    query.distinct
  end

end
