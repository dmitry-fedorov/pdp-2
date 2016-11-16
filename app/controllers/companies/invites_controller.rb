module Companies
  class InvitesController < ApplicationController
    expose :company
    expose :invite

    def create
      set_invite_params
      invite.save
      InviteMailer.send_to_owner(company, current_user, invite).deliver_now!

      respond_with invite, location: companies_url(subdomain: nil)
    end

    def invitation
      invite.update(status: params[:status])
      if params[:status] == "accepted"
        invite.user.update(company: company)
        redirect_to company_users_url(subdomain: company.domain), notice: "User was successfully invited"
      else
        redirect_to companies_url(subdomain: nil), notice: "User invitation was declined"
      end
    end

    private

    def set_invite_params
      invite.company = company
      invite.user = current_user
    end
  end
end
