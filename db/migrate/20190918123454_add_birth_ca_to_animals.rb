class AddBirthCaToAnimals < ActiveRecord::Migration[6.0]
  def change
    add_column :animals, :birth_ca, :string, default: ""
  end
end
