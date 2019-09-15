class AddNameToSponsorships < ActiveRecord::Migration[6.0]
  def change
    add_column :sponsorships, :firstname, :string
    add_column :sponsorships, :lastname, :string
    add_column :sponsorships, :email, :string
  end
end
