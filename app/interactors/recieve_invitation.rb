class RecieveInvitation
  include Interactor

  delegate :status, :invite, :company, to: :context

  def call
    invite.update(status: status)
    update_user
  end

  def update_user
    if status == "accepted"
      invite.user.update(company: company)
    else
      context.fail!
    end
  end
end
