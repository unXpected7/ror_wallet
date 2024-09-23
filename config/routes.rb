Rails.application.routes.draw do
    resources :transactions, only: [:create]
    post 'sign_in', to: 'sessions#create'
    delete 'sign_out', to: 'sessions#destroy'
  end
  