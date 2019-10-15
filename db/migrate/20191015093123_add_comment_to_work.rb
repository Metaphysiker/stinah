class AddCommentToWork < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :comment, :text, default: ""
  end
end
