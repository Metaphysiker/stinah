class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :title, default: ""
      t.text :description, default: ""
      t.text :keywords, default: ""
      t.text :search_field, default: ""
      t.text :content, default: ""

      t.timestamps
    end

    add_column :pages, :slug, :string
    add_index :pages, :slug, unique: true
  end
end
