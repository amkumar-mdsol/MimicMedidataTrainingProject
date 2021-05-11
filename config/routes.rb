Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :study_groups do
  #   resources :studies, only: [:index, :update, :create, :destroy]
  # end
  post 'create_study', to: 'studies#create'
  get 'studies', to: 'studies#index'
  patch 'update_study/:id', to: 'studies#update'

  get 'active_studies', to: 'studies#active'
  # /active_studies => active action of studies controller
  resources :studies

  resources :users

  #methods verbs that are bounded with routes
  #routes are actually url
  #get
  #put
  #post
  #patch
  #delete

  #study = relation(studies)

  #get => get a resource /studies => index action of the studies_controller

  #get => /studies/:id => show action of the controller

  #post => url is /studies => create a record.(form submitted with it) => handled by create action of controller
    # request body will have all 
  #principles
  # 1. convention over configuration
  # 2. DRY(Do not repeat yourself)


end
