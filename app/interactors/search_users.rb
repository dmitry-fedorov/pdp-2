class SearchUsers
  include Interactor

  delegate :search, :users, to: :context

  def call
    context.users = users.where("full_name LIKE ? OR email LIKE ?", "%#{search}%", "%#{search}%")
  end
end
