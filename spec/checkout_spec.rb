require "checkout"
require "item"


describe Checkout do
  let(:checkout) {described_class.new(promotional_rules)}
  let(:promotional_rules) {double(:promotion,
                                  basket_discount: 0.1,
                                  discount_threshold: 60,
                                  multibuy_discount: 0.081,
                                  multibuy_item: item_001)}
  let(:item_001) {double(:item,
                          product_code: "001",
                          name: "Travel Card Holder",
                          price: 9.25,
                          discount: "reduce")}
  let(:item_002) {double(:item,
                          product_code: "002",
                          name: "Personalised cufflinks",
                          price: 45.00,
                          discount: "reduce")}
  let(:item_003) {double(:item,
                          product_code: "003",
                          name: "Kids T-shirt",
                          price: 19.95,
                          discount: "reduce")}

  let(:item_004) {Item.new( "001","Travel Card Holder", 9.25 )}
  let(:item_005) {Item.new( "002", "Personalised cufflinks", 45.00)}
  let(:item_006) {Item.new( "003", "Kids T-shirt", 19.95)}

  describe "#initialize" do
    it "is initialized with an empty basket" do
      expect(checkout.basket.empty?).to be(true)
    end
  end

  describe "#scan" do
    it "adds an item to the basket" do
      checkout.scan(item_001)
      expect(checkout.basket.length).to eq(1)
    end
  end

  describe "#total" do
    it "totals the price of items in the basket" do
      checkout.scan(item_001)
      checkout.scan(item_002)
      checkout.scan(item_003)

      expect(checkout.total).to eq(74.20)
    end
  end

  describe "#reduce_price" do
    it "reduces the item price" do
      checkout.scan(item_004)

      checkout.reduce_price(TEN_PERCENT_DISCOUNT, checkout.basket[-1])
      expect(checkout.basket[-1].price).to eq(8.33)
    end

    it "item receives the discount method" do
      checkout.scan(item_001)

      expect(item_001).to receive(:discount)
      checkout.reduce_price(TEN_PERCENT_DISCOUNT, checkout.basket[-1])
    end

  end

  describe "#apply_basket_discount" do
    it "reduces the price by 10% if total is over £60" do
      checkout.scan(item_004)
      checkout.scan(item_005)
      checkout.scan(item_006)
      checkout.apply_basket_discount
      expect(checkout.total).to eq(66.78)
    end

    it "item receives the discount method" do
      checkout.scan(item_001)
      checkout.scan(item_002)
      checkout.scan(item_003)
      expect(item_001).to receive(:discount)
      checkout.apply_basket_discount
    end
  end


  describe "#apply_multibuy_discount" do
    # it "reduces multibuy items" do
    #   checkout.scan(item_004)
    #   checkout.scan(item_006)
    #   checkout.scan(item_004)
    #
    #   checkout.apply_multibuy_discount
    #   expect(checkout.total).to eq(36.95)
    # end

    it "item receives the discount method" do
      checkout.scan(item_001)
      checkout.scan(item_003)
      checkout.scan(item_001)

      expect(item_001).to receive(:discount)
      checkout.apply_multibuy_discount
    end
  end



end
