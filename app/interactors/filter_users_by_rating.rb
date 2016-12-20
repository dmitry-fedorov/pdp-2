class FilterUsersByRating
  include Interactor

  delegate :filter, :users, to: :context

  def call
    context.users = users.select { |user| user.decorate.average_rating.to_i >= filter.to_i }
  end
end
