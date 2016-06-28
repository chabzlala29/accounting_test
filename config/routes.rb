Rails.application.routes.draw do
  root to: 'accounts#index'

  resources :accounts, only: [:index, :create, :update, :destroy, :edit, :new] do
    resources :postings, only: [:index], controller: 'accounts/postings'
  end
  namespace :postings do
    resource :remove_postings, only: [:destroy]
  end

  resources :transactions, only: [:index, :update, :new] do
    resources :postings, only: [:index], controller: 'transactions/postings'
  end
end
