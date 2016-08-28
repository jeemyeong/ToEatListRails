Rails.application.routes.draw do
  get 'foodstagrams/makingData'
  resources :foodstagrams
  resources :foods
  post 'foods/upload'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
