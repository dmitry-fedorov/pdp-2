class CompaniesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update destroy)
  before_action :authorize_user!, only: %i(edit update destroy)

  expose :company, -> { Company.find_by(domain: request.subdomain) || Company.new(company_params) }
  expose :companies, -> { Company.all.includes(:owner) }

  def index
  end

  def show
  end

  def new
  end

  def create
    company.owner = current_user
    company.save

    respond_with company, location: company_users_url(subdomain: company.domain)
  end

  def edit
  end

  def update
    company.update(company_params)

    respond_with company, location: company_users_url(subdomain: company.domain)
  end

  def destroy
    company.destroy

    respond_with company, location: companies_url(subdomain: nil)
  end

  private

  def authorize_user!
    authorize(company, :manage?)
  end

  def company_params
    params.fetch(:company, {}).permit(:name, :domain)
  end
end
