Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # User Routes
  post 'user_token' => 'user_token#create'
  post "/users/" => "users#create"
  get "users/" => "users#logged_in"
  get "/all_users" => "users#index"
  #Receipe Routes
  resources :recipes

  #Past_meal Routes 
  resources :past_meals

  #Requirement
  resources :requirements
  resources :user_requirements


  # Nutritional Data
  get "/nutritional_data" => "nutritional_datas#index"
  get "/nutritional_data/recipe" => "nutritional_datas#get_recipe"
  get "/nutritional_data/recipe_details" => "nutritional_datas#get_recipe_details"

end
