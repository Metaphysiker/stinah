json.extract! testimonial, :id, :title, :content, :created_at, :updated_at
json.url testimonial_url(testimonial, format: :json)
