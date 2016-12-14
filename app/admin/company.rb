ActiveAdmin.register Company do
  filter :users
  filter :owner
  filter :name, as: :string
  filter :domain, as: :string
  filter :created_at, as: :date_range
  filter :updated_at, as: :date_range
end
