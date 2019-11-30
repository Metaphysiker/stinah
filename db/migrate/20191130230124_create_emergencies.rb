class CreateEmergencies < ActiveRecord::Migration[6.0]
  def change
    create_table :emergencies do |t|
      t.string :title, default: ""
      t.text :description, default: ""
      t.string :archived, default: "no"

      t.timestamps
    end
  end
end
