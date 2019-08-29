class RequestOfferComparison
  def initialize(home_request, home_offer)
    @home_request = home_request
    @home_offer = home_offer
  end

  def compare
    #attributes to compare
    attributes = ["species", "race", "age", "size", "gender", "castrated"]
    comparison_result = []

    #Comparison of species
    species_match = "table-warning"
    if @home_offer.species == @home_request.species
      species_match = "table-success"
    else
      species_match = "table-danger"
    end

    comparison_result.push(
      [
        HomeOffer.human_attribute_name("species"),
        I18n.t(@home_request.species),
        I18n.t(@home_offer.species),
        species_match
      ]
    )

    #race
    race_match = "table-warning"

    if @home_offer.species == @home_request.species
      species_match = "table-success"
    else
      species_match = "table-danger"
    end

    comparison_result.push(
      [
        HomeOffer.human_attribute_name("race"),
        I18n.t(@home_request.race),
        I18n.t(@home_offer.race),
        race_match
      ]
    )

      #array that is being send
      comparison_result
  end
end
