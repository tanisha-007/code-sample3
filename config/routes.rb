Rails.application.routes.draw do

  devise_for :employees, :controllers => {:registrations => "employees"}

  root 'welcome#index'
  
  resources :customers do
    collection do
      post :import
    end
  end

  resources :steps do
    collection do
      post :import
    end
  end
  
  resources :departments do
    collection do
      post :import
    end
  end
  
  resources :roles

  resources :employees do
    collection do
      post :import
    end
  end

  resources :categories do
    collection do
      post :import
    end
  end

  resources :products do
    collection do
      post :import
    end
  end

  resources :orders

end
