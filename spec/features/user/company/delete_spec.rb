require "rails_helper"

feature "Delete company" do
  include_context "current user signed in"
  let(:company) { create :company, owner: current_user }

  before do
    visit company_users_url(subdomain: company.domain)
  end

  scenario "User deletes company" do
    click_on "Delete"

    expect(page).to have_content("Company was successfully destroyed")
  end
end
