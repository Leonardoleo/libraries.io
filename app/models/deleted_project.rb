class DeletedProject < ApplicationRecord
  scope :updated_within, ->(start, stop) { where('updated_at >= ? and updated_at <= ? ', start, stop).order(updated_at: :asc) }

end
