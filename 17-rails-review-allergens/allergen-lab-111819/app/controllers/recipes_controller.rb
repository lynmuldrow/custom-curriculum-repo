class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end

    def sort
        @recipes = Recipe.all.sort_by{|recipe| recipe.ingredients.length}
        render :index
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(name: params["recipe"]["name"], user_id:params["recipe"]["user_id"])
        if @recipe.save
            redirect_to recipes_path
        else
            flash("There was an error!")
            redirect_to new_recipe_path
        end

    end

end
