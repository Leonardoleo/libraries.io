require 'rails_helper'

describe ProjectSerializer do
  context "without updated_at" do
    subject { described_class.new(build(:project)) }

    DEFAULT_ATTRIBUTE_NAMES = %i[
      dependent_repos_count
      dependents_count
      deprecation_reason
      description
      forks
      homepage
      keywords
      language
      latest_download_url
      latest_release_number
      latest_release_published_at
      latest_stable_release
      latest_stable_release_number
      latest_stable_release_published_at
      license_normalized
      licenses
      name
      normalized_licenses
      package_manager_url
      platform
      rank
      repository_url
      stars
      status
    ]

    it 'should have expected attribute names' do
      expect(subject.attributes.keys).to eq(DEFAULT_ATTRIBUTE_NAMES)
    end
  end

  context "with updated_at" do
    subject { described_class.new(build(:project), show_updated_at: true) }

    it 'should have expected attribute names' do
      expect(subject.attributes.keys).to eq(DEFAULT_ATTRIBUTE_NAMES + %i[updated_at])
    end
  end
end
