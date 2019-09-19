json.extract! team_member, :id, :firstname, :lastname, :description, :phone, :email, :created_at, :updated_at
json.url team_member_url(team_member, format: :json)
