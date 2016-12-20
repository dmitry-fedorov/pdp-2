module Companies
  class InvitesController < ApplicationController
    expose :company
    expose :invite

    def create
      result = InviteUser.call(user: current_user, company: company)

      if result.success?
        redirect_to companies_url(subdomain: nil), notice: "Invite was successfully created"
      else
        respond_with result.invite
      end
    end

    def invitation
      result = RecieveInvitation.call(status: params[:status], company: company, invite: invite)

      if result.success?
        redirect_to company_users_url(subdomain: company.domain), notice: "User was successfully invited"
      else
        redirect_to companies_url(subdomain: nil), notice: "User invitation was declined"
      end
    end
  end
end
