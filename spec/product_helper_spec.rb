def create_products
  Product.create(:brand => "Pågen", :product_name => "Lingongrova", :category => "Mörkt bröd", :barcode => "1212526767676", :sugar_content_gram => 8.6)
  Product.create(:brand => "Pågen", :product_name => "Tekaka", :category => "Ljust bröd", :barcode => "1212526767677", :sugar_content_gram => 11.2)
  Product.create(:brand => "Pågen", :product_name => "Rågbröd", :category => "Mörkt bröd", :barcode => "1212526767678", :sugar_content_gram => 4.2)
  Product.create(:brand => "Pågen", :product_name => "Rostbröd", :category => "Ljust bröd", :barcode => "1212526767679", :sugar_content_gram => 15.2)
end