Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'articles#index'  # root (starting page with ruby logo) routes 
    # instantly to blog main page with articles list

  resources :articles do
    resources :comments  # specify COMMENTS as sub-resource
  end

  resources :tags

  resources :authors

  resources :author_sessions, only: [ :new, :create, :destroy ]

  get 'login'  => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'


end
