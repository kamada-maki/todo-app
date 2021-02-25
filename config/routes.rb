Rails.application.routes.draw do
  devise_for :users
  root to: 'task_categories#index'
end
