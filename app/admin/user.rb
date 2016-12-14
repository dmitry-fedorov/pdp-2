ActiveAdmin.register User do
  filter :company
  filter :full_name, as: :string
  filter :email, as: :string
  filter :created_at, as: :date_range
  filter :updated_at, as: :date_range

  permit_params :email, :full_name, :password, :company

  index do
    selectable_column
    id_column
    column :email
    column :full_name
    column :created_at
    column :updated_at
    column :current_sign_in_at
    column :last_sign_in_at
    column :current_sign_in_ip
    column :last_sign_in_ip
    column :confirmed_at
    actions
  end

  form do |_|
    semantic_errors

    inputs "Details" do
      input :full_name
      input :email
      input :password, required: false
      input :company
    end

    actions
  end
end
