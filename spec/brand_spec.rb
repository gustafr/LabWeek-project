require 'brand'

describe Brand do

  it { is_expected.to have_property :id }
  it { is_expected.to have_property :name }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }

end