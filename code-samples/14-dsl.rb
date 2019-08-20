require 'pry'
require_relative './recipe'

# pizza_recipe = Recipe.new
# pizza_recipe.add_ingredient "Dough"
# pizza_recipe.add_preparation_step "Dough"

pizza_recipe = Recipe.create do
  add_ingredient "Dough"
  add_ingredient "Olive Oil"
  add_ingredient "Tomato Sauce"

  add_preparation_step "Roll the dough"
  add_preparation_step "Add the sauce"
  add_preparation_step "Add toppings"
  add_preparation_step "Bake"
end

binding.pry
