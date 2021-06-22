Rails.application.routes.draw do
  root to: "home#index"
  # ログイン、アカウント編集後、任意のページに推移させるための記述
  devise_for :users, controllers: {
          registrations: 'users/registrations'
  }
  resources :users, only: [:show, :update]
  resources :rooms

end
