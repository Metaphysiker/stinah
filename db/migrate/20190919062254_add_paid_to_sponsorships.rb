class AddPaidToSponsorships < ActiveRecord::Migration[6.0]
  def change
    add_column :sponsorships, :last_check_of_payment, :date
  end
end
