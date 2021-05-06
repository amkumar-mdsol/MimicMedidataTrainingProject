Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :study_groups do
  #   resources :studies, only: [:index, :update, :create]
  # end
  post 'create_study', to: 'studies#create'
  get 'studies', to: 'studies#index'
  patch 'update_study/:id', to: 'studies#update'
end
