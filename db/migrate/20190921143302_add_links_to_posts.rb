class AddLinksToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :video_src, :string, default: ""
  end
end
