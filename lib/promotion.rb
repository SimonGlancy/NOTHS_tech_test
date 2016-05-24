class Promotion

  attr_reader :basket_discount, :discount_threshold

    def initialize(basket_discount, discount_threshold)
      @basket_discount = basket_discount
      @discount_threshold = discount_threshold
    end

end
