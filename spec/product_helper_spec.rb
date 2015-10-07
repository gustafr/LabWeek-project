require 'byebug'

def create_products
  b = Brand.create(:name => "Pågen")
  c = Category.create(:name => "Bröd")
  Product.create(brand: b, :product_name => "Lingongrova", category: c, :barcode => "1212526767676", :sugar_content_gram => 8.6)
  Product.create(brand: b, :product_name => "Tekaka", category: c, :barcode => "1212526767677", :sugar_content_gram => 11.2)
  Product.create(brand: b, :product_name => "Rågbröd", category: c, :barcode => "1212526767678", :sugar_content_gram => 4.2)
  Product.create(brand: b, :product_name => "Rostbröd", category: c, :barcode => "1212526767679", :sugar_content_gram => 15.2)
end

def create_brand
  b = Brand.create(:name => "Pågen")
end

def create_category
 c = Category.create(:name => "Bröd")
end
