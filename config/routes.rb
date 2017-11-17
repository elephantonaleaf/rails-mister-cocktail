Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, shallow: true do
    resources :ingredients

  end

  root to: "cocktails#index"
end
