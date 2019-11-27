class AddCategoryToTestimonials < ActiveRecord::Migration[6.0]
  def change
    add_column :testimonials, :category, :string, default: ""
  end
end
