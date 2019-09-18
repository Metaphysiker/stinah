class AddArchivedToHomerequests < ActiveRecord::Migration[6.0]
  def change
    add_column :home_requests, :archived, :boolean, default: false
    add_column :home_offers, :archived, :boolean, default: false
  end
end
