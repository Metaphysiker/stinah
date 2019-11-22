class CreateChickenAdoptions < ActiveRecord::Migration[6.0]
  def change
    create_table :chicken_adoptions do |t|
      t.string :firstname
      t.string :lastname
      t.string :street
      t.string :plz
      t.string :city
      t.string :phone
      t.integer :number_of_chickens_for_adoption
      t.integer :number_of_chickens_currently
      t.text :description_of_home
      t.string :size_of_chicken_coop
      t.integer :size_of_outdoor_area
      t.string :adoption_of_a_rooster_possible
      t.boolean :acceptance_statement
      t.string :privacy_statement
      t.text :message

      t.timestamps
    end
  end
end
