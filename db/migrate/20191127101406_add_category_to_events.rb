class AddCategoryToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :category, :string, default: ""
  end
end