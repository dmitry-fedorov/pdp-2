class CompaniesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update destroy)
  before_action :authorize_user!, only: %i(edit update destroy)

  expose(:company, attributes: :company_params)
  expose(:companies)

  def index
    self.companies = fetch_companies(companies)
  end

  def show
  end

  def new
  end

  def create
    company.owner = current_user
    company.save

    respond_with(company)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def authorize_user!
    authorize(company, :manage?)
  end

  def company_params
    params.require(:company).permit(:name)
  end

  def fetch_companies(scope)
    scope.includes(:owner).decorate
  end
end
