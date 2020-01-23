class IngredientsController < ApplicationController

    def index
        @ingredients = Ingredient.all.sort_by{|ing| ing.allergens.length}.reverse
    end

    def show
        @ingredient = Ingredient.find(params[:id])
    end
end
