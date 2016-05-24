class Checkout



attr_reader :basket

BASKET_DISCOUNT = 0.1
DISCOUNT_THRESHOLD = 60
MULTIBUY_DISCOUNT = 0.081
MULTIBUY_ITEM = "xxx"

  def initialize
    @basket = []
  end

  def scan(item)
    @basket << item
  end

  def total
    @basket.inject(0.00) { |total, item| total + item.price }
  end

  def reduce_price(percentage, item)
    item.discount(percentage)
  end

  def apply_basket_discount
      @basket.each{|item| reduce_price(BASKET_DISCOUNT, item)} if basket_discount?
  end

  def apply_multibuy_discount(offer)
      find_offers_in_basket(offer).each{|item| reduce_price(MULTIBUY_DISCOUNT, item) }
  end

  def multibuy?(offer)
    @basket.count(offer) > 1
  end

  def basket_discount?
    total > DISCOUNT_THRESHOLD
  end

  def find_offers_in_basket(offer)
    @basket.select{|item| item == offer }.uniq
  end

end
