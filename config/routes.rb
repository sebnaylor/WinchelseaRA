Rails.application.routes.draw do
  resources :posts do
    resources :votes, only:[:create, :update, :destroy]
    resources :comments, only:[:create, :update, :destroy]
  end
  resources :meetings
  # devise_for :users
  root to: 'pages#home'
  get 'public_toilets_survey', to: "pages#public_toilets_survey"
  get 'facts_figures', to: "pages#facts_figures"
  get 'gta_report', to: "pages#gta_report"
  get 'gta_report_response', to: "pages#gta_report_response"
  get 'wra_constitution', to: "pages#wra_constitution"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
