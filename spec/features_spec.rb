require "checkout"
require "item"
require "promotion"

# describe Checkout do
#
#   BASKET_DISCOUNT = 0.1
#   DISCOUNT_THRESHOLD = 60
#   MULTIBUY_PRICE = 8.5
#
#   subject(:checkout) {described_class.new(promotional_rules)}
#   let(:promotional_rules) {Promotion.new( basket_discount: BASKET_DISCOUNT,
#                                           discount_threshold: DISCOUNT_THRESHOLD,
#                                           multibuy_price: MULTIBUY_PRICE,
#                                           multibuy_item: item_001)}
#
#   let(:item_001) {Item.new( "001","Travel Card Holder", 9.25 )}
#   let(:item_0011) {Item.new( "001","Travel Card Holder", 9.25 )}
#   let(:item_002) {Item.new( "002", "Personalised cufflinks", 45.00)}
#   let(:item_003) {Item.new( "003", "Kids T-shirt", 19.95)}
#
#   describe "test 001" do
#     it "scan 001,002,003 -> Total price expected: £66.78" do
#       checkout.scan(item_001)
#       checkout.scan(item_002)
#       checkout.scan(item_003)
#       checkout.apply_basket_discount
#       expect(checkout.total).to eq(66.78)
#     end
#   end
#
#   describe "test 002" do
#     it "scan 001,003,001 -> Total price expected: £36.95" do
#       checkout.scan(item_001)
#       checkout.scan(item_003)
#       checkout.scan(item_001)
#       checkout.apply_basket_discount
#       checkout.apply_multibuy_discount
#       expect(checkout.total).to eq(36.95)
#     end
#   end
#
#   describe "test 003" do
#     it "scan 001,002,001,003 -> Total price expected: £73.76" do
#       checkout.scan(item_001)
#       checkout.scan(item_002)
#       checkout.scan(item_0011)
#       checkout.scan(item_003)
#       p "XxxxXXXXXXXXXXXXXXXXXXXXX"
#       p checkout.total
#       p checkout.basket
#       p "XxxxXXXXXXXXXXXXXXXXXXXXX"
#       checkout.apply_multibuy_discount
#       p checkout.basket
#       checkout.apply_basket_discount
#
#
#       p checkout.basket
#       p checkout.total
#
#
#
#       p checkout.basket
#
#
#       expect(checkout.total).to eq(73.76)
#     end
#   end
#
# end
