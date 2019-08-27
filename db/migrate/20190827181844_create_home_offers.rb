class CreateHomeOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :home_offers do |t|
      t.string :firstname
      t.string :lastname
      t.string :street
      t.string :plz
      t.string :city
      t.string :phone
      t.string :email
      t.string :year
      t.text :experience
      t.text :motivation
      t.text :plans
      t.string :species
      t.string :race
      t.string :age
      t.string :size
      t.string :gender
      t.string :castrated
      t.string :stable
      t.text :stable_alt
      t.boolean :privacy_statement
      t.date :from_then_on

      t.timestamps
    end
  end
end
