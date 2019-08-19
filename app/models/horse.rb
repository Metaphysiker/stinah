class Horse < ApplicationRecord
  has_one_attached :portrait
  has_rich_text :description

  #before_destroy :purge_portrait_before_destroy
  #after_update :purge_portrait_after_update_if_changed

  def purge_portrait_before_destroy
    if portrait.attached?
      portrait.purge
    end
  end

  def purge_portrait_after_update_if_changed
    if portrait.changed?
      portrait_was.purge
    end
  end
end
