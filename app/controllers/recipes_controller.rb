class RecipesController < ApplicationController
    #only want this on the show, edit, update and destroy 
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]  
    
    #GET /recipes
    #GET /recipes.json
    def index
        @recipe = Recipe.all.order("created_at DESC")
    end
    
    #GET /recipes/1
    #GET/recipes/1/json
    def show
    end
    
    #GET /recipes/new
    def new
        @recipe = Recipe.new
    end
    
    
    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to @recipe, notice: "Successfully created new recipe"
        else
            render 'new'
        end
    end
    
    #GET /recipes/1/edit
    def edit
    end
    
    def update
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render 'edit'
        end
    end
    
    #DELETE /recipes/1.json
    def destroy
        @recipe.destroy
        redirect_to root_path, notice: "Successfully deleted recipe"
    end
    
    private
    #For each recipe, we need to find a recipe
    #Use callbacks to share ommon setup or constraints between actions
    def find_recipe
        @recipe = Recipe.find(params[:id])
    end
    
    #Parameter method 
    #To only allow the white list through
    def recipe_params
        params.require(:recipe).permit(:title, :description, 
        ingredients_attributes:[:id, :content, :_destroy], 
        steps_attributes:[:id, :direction, :_destroy]) 
    end
end
