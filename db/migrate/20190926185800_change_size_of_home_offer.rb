class ChangeSizeOfHomeOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :home_offers, :age, :boolean, default: true
    add_column :home_offers, :size, :boolean, default: true
  end
end
