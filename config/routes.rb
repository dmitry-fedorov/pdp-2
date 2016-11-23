Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :companies, only: %i(index new create) do
    resources :invites, only: :create, module: "companies"
    get "invitation", to: "companies/invites#invitation"
  end

  constraints Subdomain do
    root to: "companies#show", as: :company_users

    resources :articles do
      resources :comments, only: %i(create update destroy), module: :articles
    end
    resources :companies, only: %i(show edit update destroy)
  end

  root to: "companies#index"
end
