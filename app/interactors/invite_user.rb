class InviteUser
  include Interactor

  delegate :company, :user, to: :context

  def call
    context.invite = sent_invite
  end

  def sent_invite
    sent_invite = Invite.create(company: company, user: user)
    if sent_invite
      InviteMailer.company_registration(company, user, sent_invite).deliver_now!
    else
      context.fail!
    end

    sent_invite
  end
end
