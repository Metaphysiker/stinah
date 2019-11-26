class AddSearchFieldToChickenAdoption < ActiveRecord::Migration[6.0]
  def change
    add_column :chicken_adoptions, :search_field, :text, default: ""
    add_column :chicken_adoptions, :archived, :boolean, default: false
  end
end
