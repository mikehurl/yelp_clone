Rails.application.routes.draw do
devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

resources :restaurants, shallow: true do
  resources :reviews do
    resources :endorsements
  end
end

root "restaurants#index"

# get 'restaurants' => 'restaurants#index'
# get 'restaurants/new' => 'restaurants#new'

end
