Rails.application.routes.draw do
  devise_for :users
  root to: 'task_categories#index'
  resources :task_categories do
    resources :detail_tasks, only: [:new,:create,:edit,:update]
  end
end
