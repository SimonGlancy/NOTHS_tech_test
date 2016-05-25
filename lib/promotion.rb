class Promotion

  attr_reader :basket_discount, :discount_threshold, :multibuy_price, :multibuy_item

    def initialize(basket_discount: nil,
                   discount_threshold: 1000000,
                   multibuy_price: nil,
                   multibuy_item: nil)
      @basket_discount = basket_discount
      @discount_threshold = discount_threshold
      @multibuy_price = multibuy_price
      @multibuy_item = multibuy_item
    end

end
