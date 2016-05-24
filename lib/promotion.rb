class Promotion

  attr_reader :basket_discount, :discount_threshold, :multibuy_discount, :multibuy_item

    def initialize(basket_discount, discount_threshold, multibuy_discount, multibuy_item)
      @basket_discount = basket_discount
      @discount_threshold = discount_threshold
      @multibuy_discount = multibuy_discount
      @multibuy_item = multibuy_item
    end

end
