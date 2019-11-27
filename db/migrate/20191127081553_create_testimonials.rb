class CreateTestimonials < ActiveRecord::Migration[6.0]
  def change
    create_table :testimonials do |t|
      t.string :title, default: ""
      t.text :content, default: ""

      t.timestamps
    end
  end
end
