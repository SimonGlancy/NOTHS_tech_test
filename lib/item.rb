class Item

attr_reader :product_code, :name

  def initialize(product_code, name, price)
    @product_code = product_code
    @name = name
    @price = price
  end

  def price
    @price.round(2)
  end

  def discount(new_price)
    @price = new_price
  end

end
