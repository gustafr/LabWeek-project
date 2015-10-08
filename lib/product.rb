require 'net/http'
require "json"

class Product

  include DataMapper::Resource

  property :id, Serial
  property :product_name, String
  property :barcode, String
  property :sugar_content_gram, Float
  property :ranking, Integer

  belongs_to :brand
  belongs_to :category

  validates_presence_of :product_name, message: "Please fill in a name."
  validates_presence_of :barcode, message: "Please fill in barcode."
  validates_uniqueness_of :barcode, message: "Barcode already exists."
  validates_presence_of :sugar_content_gram, message: "Please fill in sugar content."

  def self.rank(product)
    result = all(:sugar_content_gram.lt => product.sugar_content_gram).count+1
    product.update!(ranking: result)
  end

  def self.update_ranking
    Product.all.each do |product|
      result = all(:sugar_content_gram.lt => product.sugar_content_gram).count+1
      product.update!(ranking: result)
    end
  end

  def self.import_product(ean)
    uri = URI('http://api.dabas.com/DABASService/V1/article/gtin/#{ean}/json?apikey=')
    @response = JSON.parse(Net::HTTP.get(uri))
    b=Brand.first
    c=Category.first
    Product.create(brand: b, :product_name => @response["Artikelbenamning"], category: c, :barcode => @response["GTIN"], :sugar_content_gram => 8.6)
  end

  #Rankning can be seen as how many Products have suger_content_gram that is lower than current record + 1

end
