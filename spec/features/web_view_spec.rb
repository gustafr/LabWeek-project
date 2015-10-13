# require 'product_helper_spec'
#require 'pry'

feature "Web View" do
  scenario "visitors to the 'categories' route see what categories are in our database" do
    visit "/categories"
    expect(page).to have_content "categories"
  end
end
