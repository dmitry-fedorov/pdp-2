require "rails_helper"

feature "Update article" do
  include_context "current user signed in"
  let!(:company) { create :company, owner: current_user }
  let!(:article) { create :article, company: company, user: current_user }

  before do
    current_user.company = company
    visit article_url(article, subdomain: company.domain)
  end

  scenario "User deletes article" do
    click_on "Delete"

    expect(page).to have_content("Article was successfully destroyed")
  end
end
