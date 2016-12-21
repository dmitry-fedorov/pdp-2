class SearchUsers
  include Interactor

  delegate :search, :users, to: :context

  def call
    context.users = users.find_by_name_or_email(search)
  end
end
