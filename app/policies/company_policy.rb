class CompanyPolicy < ApplicationPolicy
  def manage?
    user == record.owner
  end

  def create?
    user.company.blank?
  end
end
