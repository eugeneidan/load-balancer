Rails.application.routes.draw do
  get 'process', to: "load_balancer#new"

  post "process", to: "load_balancer#create"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
