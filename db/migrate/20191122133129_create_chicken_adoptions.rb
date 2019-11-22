class CreateChickenAdoptions < ActiveRecord::Migration[6.0]
  def change
    create_table :chicken_adoptions do |t|
      t.string :firstname, default: ""
      t.string :lastname, default: ""
      t.string :street, default: ""
      t.string :plz, default: ""
      t.string :city, default: ""
      t.string :phone, default: ""
      t.integer :number_of_chickens_for_adoption, default: 0
      t.integer :number_of_chickens_currently, default: 0
      t.text :description_of_home, default: ""
      t.string :size_of_chicken_coop, default: ""
      t.integer :size_of_outdoor_area, default: 0
      t.string :adoption_of_a_rooster_possible, default: "no"
      t.boolean :acceptance_statement, default: false
      t.boolean :privacy_statement, default: false
      t.text :message, default: ""

      t.timestamps
    end
  end
end
