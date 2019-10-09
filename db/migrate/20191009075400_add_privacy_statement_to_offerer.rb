class AddPrivacyStatementToOfferer < ActiveRecord::Migration[6.0]
  def change
    remove_column :home_offers, :privacy_statement
    add_column :offerers, :privacy_statement, :boolean
  end
end
