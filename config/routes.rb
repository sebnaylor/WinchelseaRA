Rails.application.routes.draw do
  resources :posts do
    resources :votes, only:[:create, :update, :destroy]
    resources :comments, only:[:create, :update, :destroy]
  end
  resources :meetings
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
