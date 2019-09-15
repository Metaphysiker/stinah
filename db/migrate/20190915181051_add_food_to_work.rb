class AddFoodToWork < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :food, :string
  end
end
