require "rails_helper"

feature "Create article" do
  include_context "current user signed in"
  let!(:company) { create :company, owner: current_user }

  context "allowed user" do
    before do
      current_user.company = company
      visit company_users_url(subdomain: company.domain)
      click_on "Blog"
      click_on "New article"
    end

    scenario "User creates a new article with valid data" do
      fill_form(:user, attributes_for(:article))
      click_on "Submit"

      expect(page).to have_content("Article was successfully created")
    end

    scenario "User creates a new article with invalid data" do
      click_on "Submit"

      expect(page).to have_content("Article could not be created")
    end
  end

  context "not allowed user" do
    scenario "User tries to visit not his blog" do
      visit company_users_url(subdomain: company.domain)

      expect(page).not_to have_link("Blog")
    end
  end
end
