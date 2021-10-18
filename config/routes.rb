Rails.application.routes.draw do
#   get "/breeds", to: "breeds#index", as: "breeds"
#   get "/breeds/:id", to: "breeds#show", as: "breed"
  root "breeds#index"
  get "/categories", to: "categories#index", as: "categories"
  get "/categories/:id", to: "categories#show", as: "category"
  get "/about", to: "about#index", as: "about"

  resources :breeds, only: %i[index show] do
    collection do
        get "search"
    end
  end
end
