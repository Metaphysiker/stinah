class CreateTeamMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :team_members do |t|
      t.string :firstname, default: ""
      t.string :lastname, default: ""
      t.text :description, default: ""
      t.string :phone, default: ""
      t.string :email, default: ""

      t.timestamps
    end
  end
end
