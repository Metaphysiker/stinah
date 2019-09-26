class ChangeSizeOfHomeOffer < ActiveRecord::Migration[6.0]
  def change
    change_column :home_offers, :age, :boolean, default: "true", using: 'age::boolean'
    change_column :home_offers, :size, :boolean, default: "true", using: 'size::boolean'
  end
end
