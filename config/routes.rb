Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }
  resources :posts do
    resources :comments
  end
  root to: "posts#index"
  get '/about' , to: 'pages#about'
end
