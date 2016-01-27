Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }
  resource :posts
  root to: "posts#index"
end
