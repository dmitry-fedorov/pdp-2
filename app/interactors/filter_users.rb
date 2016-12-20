class FilterUsers
  include Interactor

  delegate :query, :users, to: :context

  def call
    context.users = users.select { |user| user.decorate.average_rating.to_i >= query.to_i }
  end
end
