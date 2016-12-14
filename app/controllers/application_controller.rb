class ApplicationController < ActionController::Base
  before_action :authenticate_company!

  include Authentication
  include Authorization

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  def admin_access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  private

  def authenticate_company!
    return if !Subdomain.matches?(request) || Company.exists?(domain: request.subdomain)

    redirect_to companies_url(subdomain: nil), alert: t("flash.companies_auth.alert", subdomain: request.subdomain)
  end
end
