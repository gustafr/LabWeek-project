def create_products
  Product.create(:brand => "Pågen", :product_name => "Lingongrova", :category => "Mörkt bröd", :barcode => "1212526767676", :sugar_content_gram => 8.6)
  Product.create(:brand => "Pågen", :product_name => "Tekaka", :category => "Ljust bröd", :barcode => "1212526767677", :sugar_content_gram => 11.2)
  Product.create(:brand => "Pågen", :product_name => "Rågbröd", :category => "Mörkt bröd", :barcode => "1212526767678", :sugar_content_gram => 4.2)
  Product.create(:brand => "Pågen", :product_name => "Rostbröd", :category => "Ljust bröd", :barcode => "1212526767679", :sugar_content_gram => 15.2)
end

def add_product_web
  fill_in 'brand', with: 'Pågen'
  fill_in 'product_name', with: 'Lingongrova'
  fill_in 'category', with: 'Mjukt bröd'
  fill_in 'barcode', with: '1256256256526'
  fill_in 'sugar_content_gram', with: '8.5'
  click_button 'Add product'
end
