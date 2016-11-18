require "rails_helper"

feature "Create invitation request" do
  include_context "current user signed in"

  let!(:owner) { create(:user) }
  let!(:company) { create(:company, owner: owner) }

  before do
    visit companies_path
  end

  context "without pending invitation" do
    scenario "User without company creates invitation request" do
      click_on "Send request"

      expect(page).to have_content("Invite was successfully created")
    end

    scenario "Owner invites user" do
      click_on "Send request"
      open_email(owner.email)
      visit_in_email "Invite user"

      expect(page).to have_content("User was successfully invited")
      expect(page).to have_content(current_user.full_name)
    end

    scenario "Owner declines user invitation" do
      click_on "Send request"
      open_email(owner.email)
      visit_in_email "Decline invitation"

      expect(page).to have_content("User invitation was declined")
      expect(current_url).to eq("http://example.com/companies")
    end
  end

  context "with pending invitation" do
    let!(:invite) { Invite.create(user: current_user, company: company) }

    scenario "User with pending request can't see request links" do
      visit companies_path
      expect(page).to have_content("Pending Company")
      expect(page).not_to have_content("Send request")
    end
  end
end
