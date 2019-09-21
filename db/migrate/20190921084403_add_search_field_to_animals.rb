class AddSearchFieldToAnimals < ActiveRecord::Migration[6.0]
  def change
    add_column :animals, :search_field, :text, default: ""
  end
end
