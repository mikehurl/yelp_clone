Rails.application.routes.draw do
  devise_for :users, :installs  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :restaurants do
  resources :reviews
end

root "restaurants#index"

# get 'restaurants' => 'restaurants#index'
# get 'restaurants/new' => 'restaurants#new'

end
