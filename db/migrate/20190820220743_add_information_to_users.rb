class AddInformationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firstname, :string, default: ""
    add_column :users, :lastname, :string, default: ""
    add_column :users, :street, :string, default: ""
    add_column :users, :city, :string, default: ""
    add_column :users, :plz, :string, default: ""
    add_column :users, :telefon, :string, default: ""
  end
end
