class AddActiveToSponsorships < ActiveRecord::Migration[6.0]
  def change
    add_column :sponsorships, :active, :boolean, default: false
  end
end
