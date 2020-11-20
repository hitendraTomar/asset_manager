Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  resources :houses do
    get :buy, on: :member
  end
  resources :complex_buildings do
    get :buy, on: :member
  end
  resources :commecial_units do
    get :buy, on: :member
  end
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
