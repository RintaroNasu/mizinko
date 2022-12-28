Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  resources :users, only: [:show]
  root 'posts#index'
  post 'restoration/:id' => 'posts#restoration'
  post '/posts/:id/done' => 'posts#done',   as: 'done'
end
