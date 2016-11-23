require "rails_helper"

feature "Delete comment" do
  include_context "current user signed in"
  let!(:company) { create :company, owner: current_user }
  let!(:article) { create :article, user: current_user, company: company }
  let!(:comment) { create :comment, user: current_user, article: article }
  let!(:user) { create :user, company: company }
  let!(:user_comment) { create :comment, article: article, user: user }

  background do
    current_user.company = company
    visit with_subdomain article_path(article)
  end

  scenario "Comment disappears from page", js: true do
    find(".comment-wrapper").click_on "Delete"

    expect(page).not_to have_content(comment.text)
    within(".comment-wrapper") do
      expect(page).to have_content("Delete", count: 1)
    end
  end
end
