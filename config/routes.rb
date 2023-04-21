Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
  resources :records
  get 'signup', to:'users#new'
  post 'users', to:'users#create'
  resources :users, except:[:new]
end
