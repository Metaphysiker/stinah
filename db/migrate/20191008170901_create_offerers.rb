class CreateOfferers < ActiveRecord::Migration[6.0]
  def change
    create_table :offerers do |t|
      t.string :firstname
      t.string :lastname
      t.string :street
      t.string :city
      t.string :plz
      t.string :phone
      t.string :email
      t.string :year
      t.text :experience
      t.text :motivation
      t.text :plans

      t.timestamps
    end

    add_reference :home_offers, :offerer
  end
end
