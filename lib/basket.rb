

class Basket

  attr_reader :all

  def initialize(promotional_rules)
    @all = []
    @promotional_rules = promotional_rules
  end

  def add(item)
    all << item
  end

  def total
    apply_multibuy_discount
    all.inject(0.00) { |total, item| total + item.price }
  end

private

  attr_reader :promotional_rules

  def reduce_price(new_price, item)
    item.discount(new_price)
  end

  def apply_multibuy_discount
    find_offers_in_basket.each{|item| reduce_price(promotional_rules.multibuy_price, item) } if multibuy?
  end

  def multibuy?
    all.count(promotional_rules.multibuy_item) > 1
  end

  def find_offers_in_basket
    all.select{|item| item == promotional_rules.multibuy_item }.uniq
  end

end
