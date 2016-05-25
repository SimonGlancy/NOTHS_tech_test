class Checkout

attr_reader :basket

  def initialize(promotional_rules)
    @basket = []
    @promotional_rules = promotional_rules
  end

  def scan(item)
    basket << item
  end

  def total
    basket.inject(0.00) { |total, item| total + item.price }
  end

  def reduce_price(new_price, item)
    item.discount(new_price)
  end

  def apply_basket_discount
    basket.each{|item| reduce_price(promotional_rules.basket_discount, item)} if basket_discount?
  end

  def apply_multibuy_discount
    find_offers_in_basket.each{|item| reduce_price(promotional_rules.multibuy_discount, item) }
  end

private

attr_reader :promotional_rules

  def multibuy?
    basket.count(promotional_rules.multibuy_item) > 1
  end

  def basket_discount?
    total > promotional_rules.discount_threshold
  end

  def find_offers_in_basket
    basket.select{|item| item == promotional_rules.multibuy_item }.uniq
  end

end
