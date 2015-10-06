require 'product_helper_spec'

feature 'application setup' do
  feature 'root path' do

    scenario 'is successful' do
      visit '/'
      expect(page.status_code).to eq 200
    end
  end
end


feature "get fill out form" do
  before do
    visit "/admin"
  end

    scenario "creates fill out form" do
      expect(page).to have_selector "form[action='/fill_out']"
      expect(page).to have_selector "form[method='post']"
      expect(page).to have_selector "input[name='brand']"
      expect(page).to have_selector "input[name='product_name']"
      expect(page).to have_selector "input[name='category']"
      expect(page).to have_selector "input[name='barcode']"
      expect(page).to have_selector "input[name='sugar_content_gram']"
    end

  scenario 'admin user can add a new product' do
    visit "/admin"
    fill_in 'brand', with: 'Pågen'
    fill_in 'product_name', with: 'Lingongrova'
    fill_in 'category', with: 'Mjukt bröd'
    fill_in 'barcode', with: '1256256256526'
    fill_in 'sugar_content_gram', with: '8.5'
    click_button 'Create product'
    expect(page.status_code).to eq 200
    expect(page.current_path).to eq '/admin/product_listing'
    expect(page).to have_content 'Lingongrova'
  end

end
