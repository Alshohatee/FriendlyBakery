class Cookie
  attr_reader :id, :name, :description, :price
  def initialize(id, name, description, price)
    @id = id
    @name = name
    @hp = description
    @atk = price
  end
end
