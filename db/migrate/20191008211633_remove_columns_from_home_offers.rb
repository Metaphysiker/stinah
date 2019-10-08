class RemoveColumnsFromHomeOffers < ActiveRecord::Migration[6.0]
  def change
    remove_column :home_offers, :firstname
    remove_column :home_offers, :lastname
    remove_column :home_offers, :street
    remove_column :home_offers, :plz
    remove_column :home_offers, :city
    remove_column :home_offers, :phone
    remove_column :home_offers, :email
    remove_column :home_offers, :year
    remove_column :home_offers, :experience
    remove_column :home_offers, :motivation
    remove_column :home_offers, :plans
  end
end
