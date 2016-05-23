class Item

attr_reader :product_code, :name, :price

  def initialize(product_code, name, price)
    @product_code = product_code
    @name = name
    @price = price
  end

  def discount(percentage)
    @price *= (1 - percentage)
  end

end
