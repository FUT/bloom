Bloom::Application.routes.draw do
  root to: 'videos#new'

  resources :videos, only: [:new, :create, :show] do
    member do
      get :status
    end
  end
end
