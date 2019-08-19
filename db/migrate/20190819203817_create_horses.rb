class CreateHorses < ActiveRecord::Migration[6.0]
  def change
    create_table :horses do |t|
      t.string :name
      t.string :race
      t.date :birth
      t.text :description

      t.timestamps
    end
  end
end
