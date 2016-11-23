class CommentPolicy < ApplicationPolicy
  def manage?
    user == record.user
  end
end
