Bloom::Application.routes.draw do
  root to: 'videos#create'

  resources :videos do
    member do
      get :status
    end
  end
end
