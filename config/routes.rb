Rails.application.routes.draw do
  get 'sign_up/index'
  get 'verify/:id', to: 'verification#verify'
  get 'unsubscribe/:id', to: 'subscription#delete'

  resources :members

  root 'sign_up#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
