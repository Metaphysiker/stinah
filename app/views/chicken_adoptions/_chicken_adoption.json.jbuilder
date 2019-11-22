json.extract! chicken_adoption, :id, :firstname, :lastname, :street, :plz, :city, :phone, :number_of_chickens_for_adoption, :number_of_chickens_currently, :description_of_home, :size_of_chicken_coop, :size_of_outdoor_area, :adoption_of_a_rooster_possible, :acceptance_statement, :privacy_statement, :message, :created_at, :updated_at
json.url chicken_adoption_url(chicken_adoption, format: :json)
