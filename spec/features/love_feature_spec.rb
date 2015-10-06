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
    visit "/admin/fill_out"
  end

    scenario "creates fill out form" do
      expect(page).to have_selector "form[action='/fill_out']"
      expect(page).to have_selector "form[method='post']"
      expect(page).to have_selector "input[name='brand']"
      expect(page).to have_selector "input[name='product_name']"
      expect(page).to have_selector "input[name='category']"
      expect(page).to have_selector "input[name='barcode']"
      expect(page).to have_selector "input[name='sugar_content_gram']"
      expect(page).to have_selector "input[name='ranking']"
    end

end
