class RecipesController < ApplicationController
    #only want this on the show, edit, update and destroy 
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]  
    #to authenticate all pages except show and index page
    before_action :authenticate_user!, except: [:index, :show]
    
    # GET /recipes
    # GET /recipes.json
    def index
        @recipe = Recipe.all.order("created_at DESC")
    end
    
    # GET /recipes/1
     # GET /recipes/1.json
    def show
    end
    
    # GET /recipes/new
    def new
        @recipe = current_user.recipes.build
    end
    
     # POST /recipes
     # POST /recipes.json
    def create
        @recipe = current_user.recipes.build(recipe_params)
        
        if @recipe.save
            redirect_to @recipe, notice: "Successfully created new recipe"
        else
            render 'new'
        end
    end
    
    # POST /recipes/1
    # PATCH/PUT /recipes/1.json
    def update
        if @recipe.update(recipe_params)
            redirect_to @recipe, notice: "Successfully updated recipe"
        else
            render 'edit'
        end
    end
    
    # GET /recipes/1/edit
    def edit
        unless current_user == @recipe.user  #To permit only users who created a recipe to edit and delete it
        redirect_back fallback_location: root_path, notice: 'User is not owner'
        end
    end
    
    # DELETE /recipes/1
    # DELETE /recipes/1.json
    def destroy
        @recipe.destroy
        redirect_to root_path, notice: "Successfully deleted recipe"
    end
    

    private
    #Use callbacks to share common setup or constraints between actions
    
    def find_recipe
        @recipe = Recipe.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
        params.require(:recipe).permit(:title, :description, :image, :remove_image, ingredients_attributes:[:id, :content, :_destroy], steps_attributes:[:id, :direction, :_destroy]) 
    end

end