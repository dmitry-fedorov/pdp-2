class FilterUsers
  include Interactor::Organizer

  organize SortUsers, SearchUsers, FilterUsersByRating
end
