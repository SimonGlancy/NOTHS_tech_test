require "promotion"
require "checkout"
require "item"

BASKET_DISCOUNT = 0.1
DISCOUNT_THRESHOLD = 60
MULTIBUY_DISCOUNT = 0.081
MULTIBUY_ITEM = "xxx"

describe Promotion do
  let(:promotion) {described_class.new(BASKET_DISCOUNT,
                                       DISCOUNT_THRESHOLD)}

  describe "#initialize" do
    it "has a basket discount value" do
      expect(promotion.basket_discount).to eq(BASKET_DISCOUNT)
    end

    it "has a discount threshold value" do
      expect(promotion.discount_threshold).to eq(DISCOUNT_THRESHOLD)
    end
  end




end
