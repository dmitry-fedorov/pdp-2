require "rails_helper"

feature "Search users" do
  include_context "current user signed in"
  let!(:company) { create :company, owner: current_user }
  let!(:user) { create :user, company: company }

  before do
    current_user.company = company
    visit company_users_url(subdomain: company.domain)
  end

  scenario "User search himself" do
    fill_in "search", with: current_user.email
    click_on "Filter"

    expect(page).to have_content(current_user.full_name)
    expect(page).not_to have_content(user.full_name)
  end
end
