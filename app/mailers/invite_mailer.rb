class InviteMailer < ApplicationMailer
  def company_registration(company, user, invite)
    @company = company
    @user = user
    @invite = invite
    mail(to: company.owner.email, subject: "Company registration")
  end
end
