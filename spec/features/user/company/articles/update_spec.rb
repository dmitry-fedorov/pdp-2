require "rails_helper"

feature "Update article" do
  include_context "current user signed in"
  let!(:company) { create :company, owner: current_user }
  let!(:article) { create :article, company: company, user: current_user }

  before do
    current_user.company = company
    visit article_url(article, subdomain: company.domain)
    click_on "Edit"
  end

  scenario "User updates article with valid data" do
    click_on "Submit"

    expect(page).to have_content("Article was successfully updated")
  end

  scenario "User updates article with invalid data" do
    fill_in "Name", with: ""
    click_on "Submit"

    expect(page).to have_content("Article could not be updated")
  end
end
