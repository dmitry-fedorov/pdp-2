Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :companies, except: :show

  constraints Subdomain do
    root to: "companies#show", as: :company_users
  end

  root to: "companies#index"
end
