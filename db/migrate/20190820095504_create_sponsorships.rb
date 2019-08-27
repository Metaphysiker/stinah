class CreateSponsorships < ActiveRecord::Migration[6.0]
  def change
    create_table :sponsorships do |t|
      t.belongs_to :animal
      t.belongs_to :user
      t.boolean :public, default: false
      t.decimal :donation, precision: 10, scale: 2
    end
  end
end
