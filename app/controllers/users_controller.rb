class UsersController < ApplicationController
    #recipes method- to assign a recipe post with the correct user 
    #Find user by user id (parameters), pass it in an array and assign 
    #it to the instance variable 'user'
    #A recipe post by a 'user' (instance variable) is assigned to the 'recipes' (instance variable) 
    def recipes
        @user = User.find(params[:id])
        @recipes = @user.posts
    end
end
