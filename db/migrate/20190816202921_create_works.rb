class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.date :date
      t.belongs_to :user

      t.timestamps
    end
  end
end
