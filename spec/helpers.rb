

BASKET_DISCOUNT = 0.1
DISCOUNT_THRESHOLD = 60
MULTIBUY_PRICE = 8.5
LOWER_BASKET_TOTAL = 55
BASKET_TOTAL = 65
TEN_PERC_BASKET = BASKET_TOTAL*0.9

def doubles
  let(:promotional_rules) {double(:promotion,
                                  basket_discount: 0.1,
                                  discount_threshold: 60,
                                  multibuy_discount: 0.081,
                                  multibuy_item: item_001)}
  let(:basket_class) {double(:basket_class,
                             new: basket)}
  let(:basket) {double(:basket,
                       total: BASKET_TOTAL,
                       add: "added")}

   let(:checkout2) {described_class.new(promotional_rules, basket_class2)}
   let(:promotional_rules) {double(:promotion,
                                   basket_discount: 0.1,
                                   discount_threshold: 60,
                                   multibuy_discount: 0.081,
                                   multibuy_item: item_001)}
   let(:basket_class2) {double(:basket_class,
                              new: basket2)}
   let(:basket2) {double(:basket,
                        total: LOWER_BASKET_TOTAL,
                        add: "added")}

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

  let(:multibuy_item) {double(:item,
                      product_code: "001",
                      name: "Travel Card Holder",
                      price: 9.25,
                      discount: "reduce")}

  let(:item_004) {Item.new( "001","Travel Card Holder", 9.25 )}
  let(:item_005) {Item.new( "002", "Personalised cufflinks", 45.00)}
  let(:item_006) {Item.new( "003", "Kids T-shirt", 19.95)}
end
