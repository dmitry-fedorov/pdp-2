class InviteMailer < ApplicationMailer
  def send_to_owner(company, user, invite)
    @company = company
    @user = user
    @invite = invite
    mail(to: company.owner.email, subject: "Company registration")
  end
end
