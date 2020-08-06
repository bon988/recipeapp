# app/controllers/welcome_controller.rb
class WelcomeController < ApplicationController
  def index
  end
  
  #search method - variable recipes assigned to params find_recipes which contains the 
  #data parameter from the search 
  #show alert if no parameters found in search 
  def search
    apirecipes = find_recipeapi(params[:recipesearch])
    
    unless apirecipes
      flash[:alert] = 'Recipe not found'
      return render action: :index
    end
  end
end
 





    private
  #request_api(url) method - contains headers and url required to perform GET request 
  #to fetch data from the RAPIDAPI's Spoonacular API and parse the response and converts to a Ruby object
    def request_api(url)
      response = Excon.get(
        url,
        headers: {
          'X-RapidAPI-Host' => URI.parse(url).host,
          'X-RapidAPI-Key' => ENV.fetch('RAPIDAPI_API_KEY') #API key grabbed from Environment
        }
      )

      return nil if response.status != 200 #return nil if not status 200 response

      JSON.parse(response.body)
    end

  #find_recipes - method to make the request to the API using the 
  #request_api(url) method and query parameter
  #RapidAPI's Spoonacular API required parameters are: 'query' (string) eg. burger
  #must URL-encode the query to get meaningful result
    def find_recipeapi(query)
      request_api(
        "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipe/search/query=#{URI.encode(query)}"
      )
    end
    
