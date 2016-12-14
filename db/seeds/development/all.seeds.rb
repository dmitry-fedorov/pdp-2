FactoryGirl.create(:user, email: "user@example.com")
FactoryGirl.create(:user, email: "admin@example.com", role: :admin)

3.times do
  owner = FactoryGirl.create(:user)
  company = FactoryGirl.create(:company, owner: owner, domain: "domain#{owner.id}")
  owner.update(company: company)
  FactoryGirl.create_list(:user, 5, company: company)
end
