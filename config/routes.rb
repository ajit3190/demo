Rails.application.routes.draw do
  resources :carts
  resources :cart_items
	resources :services do
		get :get_service, on: :member
	end
  devise_for :users
  root to: "homes#index"
  resources :panels

  get '/search' => 'services#search', :as => 'search_page'
  resources :categories
end
