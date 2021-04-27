Rails.application.routes.draw do
  resources :gardens do
    resources :plots
  end

  resources :plants
end
