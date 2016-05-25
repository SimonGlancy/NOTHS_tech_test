class Checkout

attr_reader :basket

  def initialize(promotional_rules=Promotion.new, basket=Basket)
    @basket = basket.new(promotional_rules)
    @promotional_rules = promotional_rules
  end

  def scan(item)
    basket.add(item)
  end

  def total
    basket_discount? ? discount_total.round(2) : basket.total
  end

private

attr_reader :promotional_rules

  def basket_discount?
    basket.total > promotional_rules.discount_threshold
  end

  def reduction
    1 - promotional_rules.basket_discount
  end

  def discount_total
    reduction * basket.total
  end
end
