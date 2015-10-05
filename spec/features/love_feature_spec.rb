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
    visit "/fill_in"
  end

    scenario "creates fill out form" do
      expect(page).to have_selector "form[action='/fill_out']"
      expect(page).to have_selector "form[method='post']"
      expect(page).to have_selector "input[name='Product_name']"
      expect(page).to have_selector "input[name='Brand']"
      expect(page).to have_selector "input[name='Category']"
      expect(page).to have_selector "input[name='Barcode']"
      expect(page).to have_selector "input[name='Sugar_content']"
    end

end
