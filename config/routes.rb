Rails.application.routes.draw do
  devise_for :users
  root to: 'task_categories#index'
  resources :task_categories
end
