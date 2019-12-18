class Muffin
  attr_reader :id, :name, :img, :ingredientLines, :price, :calories
  def initialize(id, name, img,ingredientLines, calories, price)
    @id = id
    @name = name
    @img = img
    @ingredientLines = ingredientLines
    @calories = calories
    @price = price
  end
end
