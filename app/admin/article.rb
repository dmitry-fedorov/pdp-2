ActiveAdmin.register Article do
  filter :user
  filter :company
  filter :name, as: :string
  filter :created_at, as: :date_range
  filter :updated_at, as: :date_range
end
