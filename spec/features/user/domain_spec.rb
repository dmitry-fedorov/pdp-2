require "rails_helper"

feature "Domain spec" do
  include_context "current user signed in"

  before do
    visit companies_path
  end

  scenario "User tries to visit non existing domain" do
    visit "http://nonexistingdomain.example.com/"

    expect(current_url).to eq("http://example.com/")
    expect(page).to have_content("Company with domain 'nonexistingdomain' does not exist.")
  end
end
