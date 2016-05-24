class Checkout

attr_reader :basket

  def initialize(promotional_rules)
    @basket = []
    @basket_discount = promotional_rules.basket_discount
    @discount_threshold = promotional_rules.discount_threshold
    @multibuy_discount = promotional_rules.multibuy_discount
    @multibuy_item = promotional_rules.multibuy_item
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
      @basket.each{|item| reduce_price(@basket_discount, item)} if basket_discount?
  end

  def apply_multibuy_discount
      find_offers_in_basket.each{|item| reduce_price(@multibuy_discount, item) }
  end

private

  def multibuy?
    @basket.count(@multibuy_item) > 1
  end

  def basket_discount?
    total > @discount_threshold
  end

  def find_offers_in_basket
    @basket.select{|item| item == @multibuy_item }.uniq
  end

end
