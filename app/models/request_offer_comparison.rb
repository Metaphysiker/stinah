require 'fuzzystringmatch'

class RequestOfferComparison
  def initialize(home_request: nil, home_offer: nil)
    @home_request = home_request
    @home_offer = home_offer
  end

  #def initialize(home_request, home_offer)
  #  @home_request = home_request
  #  @home_offer = home_offer
  #end

  def find_matches_for_offer(home_offer)
    #only same species
    home_requests = HomeRequest.where(species: home_offer.species)

    #only before killing date or blank
    ids_of_timely_requests = []
    home_requests.each do |home_request|
      if home_request.date_of_killing.blank?
        ids_of_timely_requests.push(home_request.id)
      elsif home_request.date_of_killing > home_offer.from_then_on
        ids_of_timely_requests.push(home_request.id)
      end
    end
    home_requests = home_requests.where(id: ids_of_timely_requests)

    #only where 4 matches exist
    ids_of_matching_requests = []
    home_requests.each do |home_request|
      if compare(home_request, home_offer)[1] > 3
        ids_of_matching_requests.push(home_request.id)
      end
    end

    home_requests = home_requests.where(id: ids_of_matching_requests)
  end

  def find_matches_for_request(home_request)
    #only same species
    home_offers = HomeOffer.where(species: home_request.species)

    #only before killing date or blank
    ids_of_timely_requests = []
    home_offers.each do |home_offer|
      if home_request.date_of_killing.blank?
        ids_of_timely_requests.push(home_request.id)
      elsif home_request.date_of_killing > home_offer.from_then_on
        ids_of_timely_requests.push(home_request.id)
      end
    end

    home_offers = home_offers.where(id: ids_of_timely_requests)

    #only where 4 matches exist
    ids_of_matching_requests = []
    home_offers.each do |home_offer|
      if compare(home_request, home_offer)[1] > 3
        ids_of_matching_requests.push(home_request.id)
      end
    end

    home_offers = home_offers.where(id: ids_of_matching_requests)
    byebug
  end


  def compare(home_request, home_offer)
    #attributes to compare
    #attributes = ["species", "race", "age", "size", "gender", "castrated", "rideable"]
    comparison_result = []
    matches = 0

    #Comparison of species
    species_match = "table-warning"
    if home_offer.species == home_request.species
      species_match = "table-success"
      matches += 1
    else
      species_match = "table-danger"
    end

    comparison_result.push(
      [
        HomeOffer.human_attribute_name("species"),
        I18n.t(home_request.species),
        I18n.t(home_offer.species),
        species_match
      ]
    )

    #race
    race_match = "table-warning"
    fuzzystringmatch = FuzzyStringMatch::JaroWinkler.create( :native )
    distance = fuzzystringmatch.getDistance(  home_request.race, home_offer.race)
    if distance >= 0.7
      race_match = "table-success"
      matches += 1
    elsif distance < 0.7 && distance >= 0.3
      race_match = "table-warning"
      matches += 1
    else
      race_match = "table-danger"
    end

    comparison_result.push(
      [
        HomeOffer.human_attribute_name("race"),
        home_request.race,
        home_offer.race,
        race_match
      ]
    )

    #age
    age_match = "table-warning"
    if home_request.age.between?(home_offer.min_age, home_offer.max_age)
      age_match = "table-success"
      matches += 1
    else
      age_match = "table-danger"
    end

    comparison_result.push(
      [
        "Alter (in Jahren)",
        home_request.age,
        "#{home_offer.min_age}-#{home_offer.max_age}",
        age_match
      ]
    )

    #size
    size_match = "table-warning"
    if home_request.size.between?(home_offer.min_size, home_offer.max_size)
      size_match = "table-success"
      matches += 1
    else
      size_match = "table-danger"
    end

    comparison_result.push(
      [
        "Grösse (in Centimeter)",
        home_request.size,
        "#{home_offer.min_size}-#{home_offer.max_size}",
        size_match
      ]
    )

    #Comparison of gender
    gender_match = "table-warning"
    if home_offer.gender == "whatever"
      gender_match = "table-success"
      matches += 1
    elsif home_offer.gender == home_request.gender
      gender_match = "table-success"
      matches += 1
    else
      gender_match = "table-danger"
    end

    comparison_result.push(
      [
        HomeOffer.human_attribute_name("gender"),
        I18n.t(home_request.gender),
        I18n.t(home_offer.gender),
        gender_match
      ]
    )

    #Comparison of castrated
    castrated_match = "table-warning"
    if home_offer.castrated == "whatever"
      castrated_match = "table-success"
      matches += 1
    elsif home_offer.castrated == home_request.castrated
      castrated_match = "table-success"
      matches += 1
    else
      castrated_match = "table-danger"
    end

    comparison_result.push(
      [
        HomeOffer.human_attribute_name("castrated"),
        I18n.t(home_request.castrated),
        I18n.t(home_offer.castrated),
        castrated_match
      ]
    )

    #rideable
    rideable_match = "table-warning"
    if !(!home_request.rideable && home_offer.rideable)
      rideable_match = "table-success"
      matches += 1
    else
      rideable_match = "table-danger"
    end

    comparison_result.push(
      [
        "Reitbar? / Wird es geritten?",
        I18n.t(home_request.rideable),
        I18n.t(home_offer.rideable),
        rideable_match
      ]
    )

    #Comparison of date
    date_match = "table-warning"
    date_sentence = "Vorhandene Zeit"
    date_of_killing_sentence = "Kein Termin festgelegt."

    if home_request.date_of_killing.blank?
      date_match = "table-success"
      date_of_killing_sentence = "Kein Termin festgelegt."
      matches += 1
    elsif home_request.date_of_killing > home_offer.from_then_on
      date_match = "table-success"
      date_sentence = "Vorhandene Zeit: #{(home_offer.from_then_on..home_request.date_of_killing).count} Tage"
      date_of_killing_sentence = "Schlachttermin: #{I18n.l(home_request.date_of_killing)}"
      matches += 1
    else
      date_match = "table-danger"
      date_of_killing_sentence = "Schlachttermin: #{I18n.l(home_request.date_of_killing)}"
    end

    comparison_result.push(
      [
        date_sentence,
        date_of_killing_sentence,
        "ab: #{I18n.l(home_offer.from_then_on)}",
        date_match
      ]
    )

      #array that is being send
      [comparison_result, matches]
  end
end
