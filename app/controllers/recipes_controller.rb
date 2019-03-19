class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.new(name: '', quantity: '')
    @recipe.ingredients.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    #byebug
    redirect_to @recipe
  end

  private
  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :id,
        :name,
        :quantity
      ]
    )
  end
end
