class Page < ApplicationRecord
<<<<<<< HEAD
  extend FriendlyId
  friendly_id :title, use: :slugged
=======
    has_one_attached :cover
>>>>>>> 4ea6d38760494dc52aad298c82e481c71ee059a8
end
