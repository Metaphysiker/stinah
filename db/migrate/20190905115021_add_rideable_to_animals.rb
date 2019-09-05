class AddRideableToAnimals < ActiveRecord::Migration[6.0]
  def change
    add_column :home_requests, :rideable, :boolean
    add_column :home_offers, :rideable, :boolean
  end
end
