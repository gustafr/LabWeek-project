require 'product'

describe Product do

  it { is_expected.to have_property :id }
  it { is_expected.to have_property :brand }
  it { is_expected.to have_property :product_name }
  it { is_expected.to have_property :category }
  it { is_expected.to have_property :barcode }
  it { is_expected.to have_property :sugar_content_gram }
  it { is_expected.to have_property :sugar_content_percentage }
  it { is_expected.to have_property :ranking }

  it { is_expected.to validate_presence_of :brand }
  it { is_expected.to validate_presence_of :product_name }
  it { is_expected.to validate_presence_of :category }
  it { is_expected.to validate_presence_of :barcode }
  it { is_expected.to validate_uniqueness_of :barcode }
  it { is_expected.to validate_presence_of :sugar_content_gram }

end