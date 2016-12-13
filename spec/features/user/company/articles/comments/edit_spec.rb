require "rails_helper"

feature "Edit comment" do
  include_context "current user signed in"
  let!(:company) { create :company, owner: current_user }
  let!(:article) { create :article, user: current_user, company: company }
  let!(:comment) { create :comment, user: current_user, article: article }

  before do
    current_user.company = company
    visit with_subdomain article_path(article)
  end

  scenario "Edited comment shows on the page", js: true do
    find(".comment-wrapper").click_on "Edit"
    within ".edit-comment-form" do
      fill_in "comment_text", with: "My beautiful comment"
    end
    click_on "Edit comment"

    expect(page).to have_content("My beautiful comment")
  end
end
