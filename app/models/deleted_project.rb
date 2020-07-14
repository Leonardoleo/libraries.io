class DeletedProject < ApplicationRecord
  scope :updated_within, ->(start, stop) { where('updated_at >= ? and updated_at <= ? ', start, stop).order(updated_at: :asc) }

  def self.digest_from_platform_and_name(platform, name)
    sha1 = Digest::SHA1.new
    sha1.update(platform)
    sha1.update(name)
    sha1.hexdigest
  end

  def self.create_from_platform_and_name!(platform, name)
    DeletedProject.create!(digest: digest_from_platform_and_name(platform, name))
  end

end
