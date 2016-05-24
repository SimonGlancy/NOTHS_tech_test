require "promotion"
require "checkout"
require "item"



describe Promotion do

  BASKET_DISCOUNT = 0.1
  DISCOUNT_THRESHOLD = 60
  MULTIBUY_DISCOUNT = 0.081


  let(:promotion) {described_class.new(BASKET_DISCOUNT,
                                       DISCOUNT_THRESHOLD,
                                       MULTIBUY_DISCOUNT, multibuy_item)}
  let(:multibuy_item) {double(:item,
                      product_code: "001",
                      name: "Travel Card Holder",
                      price: 9.25,
                      discount: "reduce")}

  describe "#initialize" do
    it "has a basket discount value" do
      expect(promotion.basket_discount).to eq(BASKET_DISCOUNT)
    end

    it "has a discount threshold value" do
      expect(promotion.discount_threshold).to eq(DISCOUNT_THRESHOLD)
    end

    it "has a multibuy discount" do
      expect(promotion.multibuy_discount).to eq(MULTIBUY_DISCOUNT)
    end

    it "has a multibuy item" do
      expect(promotion.multibuy_item).to eq(multibuy_item)
    end

  end




end
