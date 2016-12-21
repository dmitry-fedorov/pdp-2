class FilterUsersByRating
  include Interactor

  delegate :filter, :users, to: :context

  def call
    context.users = users.filter_by_rating(filter.to_i)
  end
end
