class Work < ApplicationRecord
  belongs_to :user

  def self.get_users(collection)
    user_ids = []
    collection.each do |c|
      user_ids.push(c.user.id)
    end
    user_ids
    User.where(id: user_ids)
  end

end
