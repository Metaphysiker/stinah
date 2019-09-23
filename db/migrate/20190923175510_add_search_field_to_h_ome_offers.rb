class AddSearchFieldToHOmeOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :home_offers, :search_field, :text, default: ""
    add_column :home_requests, :search_field, :text, default: ""
  end
end
