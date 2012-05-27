PartyTown::Application.routes.draw do
  devise_for :users
  root to: "welcome#index"
  resources :events
end
