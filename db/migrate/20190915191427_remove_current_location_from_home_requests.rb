class RemoveCurrentLocationFromHomeRequests < ActiveRecord::Migration[6.0]
  def change
    remove_column :home_requests, :current_location, :string
  end
end
