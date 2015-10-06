class Product

  include DataMapper::Resource

  property :id, Serial
  property :brand, String
  property :product_name, String
  property :category, String
  property :barcode, String
  property :sugar_content_gram, Float
  property :ranking, Integer

  validates_presence_of :brand, message: "Please fill in brand."
  validates_presence_of :product_name, message: "Please fill in a name."
  validates_presence_of :category, message: "Please fill in a category."
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

  #Rankning can be seen as how many Products have suger_content_gram that is lower than current record + 1

end
