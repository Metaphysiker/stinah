class ChangeSizeOfHomeRequest < ActiveRecord::Migration[6.0]
  def change
    change_column :home_requests, :size, :integer, using: 'size::integer'
  end
end
