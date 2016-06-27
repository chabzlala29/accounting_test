Rails.application.routes.draw do
  root to: 'home#index'

  resources :accounts, only: [:index, :create, :update, :destroy, :edit, :new] do
    resources :postings, only: [:index], controller: 'accounts/postings'
  end

  resources :transactions, only: [:index, :create, :new]
end
