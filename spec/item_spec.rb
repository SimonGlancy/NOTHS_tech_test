require "item"

describe Item do
  PRODUCT_CODE_ONE = "001"
  ITEM_NAME_ONE = "Travel Card Holder"
  ITEM_PRICE_ONE = 9.25
  TWENTY_PERCENT_DISCOUNT = 0.2

  let(:item) {described_class.new(PRODUCT_CODE_ONE,ITEM_NAME_ONE,ITEM_PRICE_ONE)}


  describe "#initialize" do
    it "is initialized with a product code" do
      expect(item.product_code).to eq(PRODUCT_CODE_ONE)
    end

    it "is initialized with a name" do
      expect(item.name).to eq(ITEM_NAME_ONE)
    end

    it "is initialized with a price" do
      expect(item.price).to eq(ITEM_PRICE_ONE)
    end
  end

  describe "#discount" do
    it "reduces the price of the item" do
      item.discount(TWENTY_PERCENT_DISCOUNT)
      expect(item.price).to eq(ITEM_PRICE_ONE * (1 - TWENTY_PERCENT_DISCOUNT))
    end
  end

end
