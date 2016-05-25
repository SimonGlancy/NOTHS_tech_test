require 'item'
require 'basket'
require 'promotion'
require 'helpers'

describe Basket do

  doubles

  subject(:basket) {described_class.new(promotional_rules)}


  let(:promotional_rules) {double( :promotion,
                                    basket_discount: BASKET_DISCOUNT,
                                    discount_threshold: DISCOUNT_THRESHOLD,
                                    multibuy_price: MULTIBUY_PRICE,
                                    multibuy_item: item_001)}




  describe "#initialize" do
    it "has an empty array called all" do
      expect(basket.all.empty?).to be(true)
    end
  end

  describe "#add" do
    it "places an object into the basket array" do
      basket.add(item_001)
      expect(basket.all.empty?).to be(false)
    end
  end

  describe "#total" do
    it "totals the price of items in the basket" do
      basket.add(item_001)
      basket.add(item_002)
      basket.add(item_003)

      expect(basket.total).to eq(74.20)
    end

    it "item receives the discount method" do
      basket.add(item_001)
      basket.add(item_003)
      basket.add(item_001)

      expect(item_001).to receive(:discount)
      basket.total
    end
  end





end
