class Recipe
  attr_accessor :ingredients, :preparation_steps

  class << self
    def create(&block)
      recipe = new

      recipe.instance_eval &block

      recipe
    end
  end

  def initialize
    @ingredients = []
    @preparation_steps = []
  end

  def add_ingredient(ingredient)
    @ingredients << ingredient
  end

  def add_preparation_step(preparation_step)
    @preparation_steps << preparation_step
  end
end
