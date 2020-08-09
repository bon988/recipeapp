Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  
  #root route- pointing to the WelcomeController's index method
  root 'welcome#index'
  get 'welcome/index'
  
  #search_path route- shows results from the 'spoonacular rapidAPI' API request  
  get '/search' => 'welcome#search'
 
  #get 'recipes' => 'recipes'#recipe
  get 'users/:id/recipes' => 'users#recipes', :as => :user_recipes
  
 
end