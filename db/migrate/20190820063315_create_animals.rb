class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.text :description
      t.string :species
      t.string :race
      t.date :birth

      t.timestamps
    end
  end
end
