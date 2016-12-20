class SearchUsers
  include Interactor

  delegate :query, :users, to: :context

  def call
    context.users = users.where("full_name LIKE ? OR email LIKE ?", "%#{query}%", "%#{query}%")
  end
end
