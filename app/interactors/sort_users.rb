class SortUsers
  include Interactor

  delegate :sort, :direction, :company, to: :context

  def call
    context.users = sort_users
  end

  def sort_users
    if sort == "article count"
      company.article_count(direction)
    else
      company.average_rating(direction)
    end
  end
end
