class AddTimeToWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :shift_start, :datetime
    add_column :works, :shift_end, :datetime
  end
end
