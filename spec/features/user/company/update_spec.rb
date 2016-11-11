require "rails_helper"

feature "Update company" do
  include_context "current user signed in"
  let(:company) { create :company, owner: current_user }

  before do
    visit company_users_url(subdomain: company.domain)
  end

  scenario "User updates company with valid data" do
    click_on "Edit"

    fill_form(:company, :update, domain: "kek")
    click_on "Submit"

    expect(current_url).to eq("http://kek.example.com/")
    expect(page).to have_content("Company was successfully updated")
  end

  scenario "User updates company with invalid data" do
    click_on "Edit"
    fill_in "Domain", with: ""

    click_on "Submit"

    expect(page).to have_content("Company could not be updated")
  end
end
