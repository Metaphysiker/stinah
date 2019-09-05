class CreateHomeRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :home_requests do |t|
      t.boolean :are_you_owner
      t.string :owner_firstname
      t.string :owner_lastname
      t.string :owner_street
      t.string :owner_plz
      t.string :owner_city
      t.string :owner_phone
      t.string :owner_email
      t.boolean :does_owner_agree_with_mediation
      t.boolean :do_you_own_authority_of_mediation
      t.string :messenger_firstname
      t.string :messenger_lastname
      t.string :messenger_street
      t.string :messenger_plz
      t.string :messenger_city
      t.string :messenger_phone
      t.string :messenger_mail
      t.boolean :killing_of_animal_intended
      t.boolean :killing_of_animal_scheduled
      t.date :date_of_killing
      t.string :species
      t.string :race
      t.integer :age
      t.string :size
      t.string :color
      t.string :gender
      t.string :castrated
      t.string :current_location
      t.text :features
      t.string :stable_owner_firstname
      t.string :stable_owner_lastname
      t.string :stable_street
      t.string :stable_plz
      t.string :stable_city
      t.string :stable_phone
      t.text :how_was_animal_held
      t.text :how_was_animal_used
      t.text :reason_of_request
      t.text :is_animal_healthy
      t.boolean :privacy_statement

      t.timestamps
    end
  end
end
