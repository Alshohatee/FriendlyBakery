class Cake
  attr_reader :id, :name, :description, :price
  def initialize(id, name, img,description, price)
    @id = id
    @name = name
    @img = img
    @description = description
    @price = price
  end
end
