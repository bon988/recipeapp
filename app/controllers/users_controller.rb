class UsersController < ApplicationController
    def recipes
        @user = User.find(params[:id])
        @recipes = @user.posts
    end
end
