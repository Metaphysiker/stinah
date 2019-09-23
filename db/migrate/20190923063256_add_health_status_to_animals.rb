class AddHealthStatusToAnimals < ActiveRecord::Migration[6.0]
  def change
    add_column :animals, :health_status, :string, default: "healthy"
  end
end
