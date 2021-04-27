Rails.application.routes.draw do
  resources :gardens
  resources :plots
  resources :plot_plants
  resources :plants
end
