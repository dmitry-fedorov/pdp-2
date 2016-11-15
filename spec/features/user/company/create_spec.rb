require "rails_helper"

feature "Create company" do
  include_context "current user signed in"

  before do
    visit companies_path
  end

  let(:name) { "Best company ever" }

  scenario "User creates company with valid data" do
    click_on "Create company"

    fill_form(:company, :create, name: name, domain: "kek")
    click_on "Submit"

    expect(current_url).to eq("http://kek.example.com/")
    expect(page).to have_content("Company was successfully created")
  end

  scenario "User creates company with invalid data" do
    click_on "Create company"
    click_on "Submit"

    expect(page).to have_content("Company could not be created")
  end
end
