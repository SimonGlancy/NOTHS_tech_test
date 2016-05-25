require "promotion"
require "checkout"
require "item"
require "helpers"



describe Promotion do

  subject(:promotion) {described_class.new(basket_discount: BASKET_DISCOUNT,
                                       discount_threshold: DISCOUNT_THRESHOLD,
                                       multibuy_price: MULTIBUY_PRICE,
                                       multibuy_item: multibuy_item)}
  let(:promotion2) {described_class.new}
  doubles

  describe "#initialize" do
    it "has a basket discount value" do
      expect(promotion.basket_discount).to eq(BASKET_DISCOUNT)
    end

    it "has a discount threshold value" do
      expect(promotion.discount_threshold).to eq(DISCOUNT_THRESHOLD)
    end

    it "has a multibuy price" do
      expect(promotion.multibuy_price).to eq(MULTIBUY_PRICE)
    end

    it "has a multibuy item" do
      expect(promotion.multibuy_item).to eq(multibuy_item)
    end

  end




end
