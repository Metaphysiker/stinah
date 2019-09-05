class AddMinAgeToHomeOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :home_offers, :min_age, :integer
    add_column :home_offers, :max_age, :integer
    add_column :home_offers, :min_size, :integer
    add_column :home_offers, :max_size, :integer
    remove_column :home_offers, :size, :string
    remove_column :home_offers, :age, :string
  end
end
