Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  resources :recipes
  
  root 'welcome#index'
 
  #get 'recipes' => 'recipes'#recipe
  get 'users/:id/recipes' => 'users#recipes', :as => :user_recipes
end

