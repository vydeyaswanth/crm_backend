Rails.application.routes.draw do
  resources :customers do
    resources :contacts, only: [:index, :create, :show, :update, :destroy]
    resources :interactions, only: [:index, :create, :show, :update, :destroy]
  end  
end
