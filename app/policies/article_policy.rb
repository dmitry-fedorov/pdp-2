class ArticlePolicy < ApplicationPolicy
  def manage?
    user == record.user || user == record.company_owner
  end
end
