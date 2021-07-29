Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :efeitocolaterals
  resources :tipos, except: [:show]
  resources :products
  resources :sales
  resources :acompanhamentos
  resources :diarios
  resources :profiles, only: [:show, :edit, :update]


  resources :acompanhamentos do
    member do
      get 'finalizar'=> 'acompanhamento#finalizar'
   end
  end

  resources :diarios do
    member do
      get 'resultado'=> 'diario#resultado'
   end
  end

end
