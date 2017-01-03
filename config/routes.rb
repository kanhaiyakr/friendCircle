Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'users#index'
    devise_scope :user do
      get "users/sign_out" => "devise/sessions#destroy"
    end 
  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end

  resources :conversations do
    resources :messages
  end

end
