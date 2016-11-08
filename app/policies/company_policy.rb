class CompanyPolicy < ApplicationPolicy
  def manage?
    user == record.owner
  end
end
