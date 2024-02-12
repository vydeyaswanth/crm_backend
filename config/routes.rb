Rails.application.routes.draw do
  resources :customers do
    resources :contacts
    resources :interactions
  end
end
