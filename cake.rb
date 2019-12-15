class Cake
  attr_reader :id, :name, :img, :ingredientLines, :price
  def initialize(id, name, img,ingredientLines, price)
    @id = id
    @name = name
    @img = img
    @ingredientLines = ingredientLines
    @price = price
  end
end
