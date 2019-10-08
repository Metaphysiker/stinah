class AddSearchFieldToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offerers, :search_field, :text, default: ""
  end
end
