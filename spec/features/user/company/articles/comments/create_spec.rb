require "rails_helper"

feature "Create comment" do
  include_context "current user signed in"

  let!(:company) { create :company, owner: current_user }
  let!(:article) { create :article, user: current_user, company: company }

  before do
    current_user.company = company
    visit article_url(article, subdomain: company.domain)

    fill_in "comment_text", with: "My beautiful comment"
    click_on "Add comment"
  end

  scenario "Comment shows on the page", js: true do
    expect(page).to have_content("My beautiful comment")
    expect(page).to have_field("comment_text", with: "")
  end
end
