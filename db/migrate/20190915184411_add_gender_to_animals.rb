class AddGenderToAnimals < ActiveRecord::Migration[6.0]
  def change
    add_column :animals, :gender, :string
    add_column :animals, :size, :integer
  end
end
