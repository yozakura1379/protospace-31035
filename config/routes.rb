Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :users, only: [:new, :edit, :update, :show]
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy,] do
    resources :comments, only: [:create]
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end


