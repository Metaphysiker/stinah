require 'fuzzystringmatch'

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
    fuzzystringmatch = FuzzyStringMatch::JaroWinkler.create( :native )
    distance = fuzzystringmatch.getDistance(  @home_request.race, @home_offer.race)
    if distance >= 0.7
      race_match = "table-success"
    elsif distance < 0.7 && distance >= 0.3
      race_match = "table-warning"
    else
      race_match = "table-danger"
    end

    comparison_result.push(
      [
        HomeOffer.human_attribute_name("race"),
        @home_request.race,
        @home_offer.race,
        race_match
      ]
    )

    #Comparison of gender
    gender_match = "table-warning"
    if @home_offer.gender == "whatever"
      gender_match = "table-success"
    elsif @home_offer.gender == @home_request.gender
      gender_match = "table-success"
    else
      gender_match = "table-danger"
    end

    comparison_result.push(
      [
        HomeOffer.human_attribute_name("gender"),
        I18n.t(@home_request.gender),
        I18n.t(@home_offer.gender),
        gender_match
      ]
    )

    #Comparison of castrated
    castrated_match = "table-warning"
    if @home_offer.castrated == "whatever"
      castrated_match = "table-success"
    elsif @home_offer.castrated == @home_request.castrated
      castrated_match = "table-success"
    else
      castrated_match = "table-danger"
    end

    comparison_result.push(
      [
        HomeOffer.human_attribute_name("castrated"),
        I18n.t(@home_request.castrated),
        I18n.t(@home_offer.castrated),
        castrated_match
      ]
    )

    #Comparison of date
    date_match = "table-warning"
    date_sentence = "Vorhandene Zeit"
    if @home_request.date_of_killing.blank?
      date_match = "table-success"
    elsif @home_request.date_of_killing > @home_offer.from_then_on
      date_match = "table-success"
      date_sentence = "Vorhandene Zeit: #{(@home_offer.from_then_on..@home_request.date_of_killing).count} Tage"
    else
      date_match = "table-danger"
    end

    comparison_result.push(
      [
        date_sentence,
        I18n.t(@home_request.castrated),
        I18n.t(@home_offer.castrated),
        date_match
      ]
    )

      #array that is being send
      comparison_result
  end
end
