require "checkout"
require "item"
require "helpers"


describe Checkout do


  subject(:checkout) {described_class.new(promotional_rules,
                                          basket_class)}
  doubles

  describe "#initialize" do
    it "is initialized with an empty basket" do
      expect(checkout.basket).to be(basket)
    end
  end

  describe "#scan" do
    it "adds an item to the basket" do
      expect(basket).to receive(:add)
      checkout.scan(item_001)
    end
  end

  describe "#total" do
    it "gives the correct total (including the basket discount)" do
      expect(checkout.total).to eq(TEN_PERC_BASKET)
    end

    it "gives the correct total (without the basket discount)" do
      expect(checkout2.total).to eq(LOWER_BASKET_TOTAL)
    end
  end




end
