# Not On the High Street - Tech Test

#### Author: Simon Glancy
#### Date: 25/05/2016

This is a response to the following tech test:

### Challenge

notonthehighstreet.com is an online marketplace, here is a sample of some of the products available on our site:

| Product code | Name | Price |
|---|---|---|
| 001 | Travel Card Holder | £9.25 |
| 002 | Personalised cufflinks | £45.00 |
| 003 | Kids T-shirt | £19.95 |

Our marketing team want to offer promotions as an incentive for our customers to purchase these items.

* If you spend over £60, then you get 10% off your purchase

* If you buy 2 or more travel card holders then the price drops to £8.50.

Our check-out can scan items in any order, and because our promotions will change, it needs to be flexible regarding our promotional rules.

---------------
### Code Requirements

The interface to our checkout looks like this (shown in Ruby):
```
co = Checkout.new(promotional_rules)

co.scan(item)

co.scan(item)

price = co.total

Implement a checkout system that fulfills these requirements.

```
----------

### Test Data
|No. | Basket | Total price expected |
|---|---|---|
| 1 | 001,002,003 | £66.78 |
| 2 | 001,003,001 | £36.95 |
| 3 | 001,002,001,003 | £73.76 |

---------

### Solution

I attempted to complete this task in the most object oriented manner possible, my final solution has four seperate classes attempting to adhere to SOLID principles as much as possible.

I saw one of the promotions as being local and one being global and have therefore implemented them at different stages of checkout process as described below.

##### Classes

Item - This is an object has all of the data shown and includes a discount method which allows the object to change it's price if required (through the promotion).

Basket - This is an object which can store item objects, the multibuy promotion is discounted in this class as part of the total method this would allow for the total spend discount to be calculated seemlessley in the checkout class.

Checkout - This is primarily a wrapper/controller to handle selecting items and placing them in the basket. This class has a total method which checks the basket total and applies the appropriate discount percentage due to the threshold value specified by the promotion object.

Promotion - The intention was to have an object where the different rules could be centrally stored to be passed through the system where appropriate.

##### Testing

The solution is fully tested using RSpec and a feature test of the 3 pieces of test data is included. I have used dependency injection to adhere to single responsibility principle and have therefore been able to double all external classes in my tests.

###### Conclusions

I am happy with this solution as I have not used researched and tried to replicate a known checkout/promotions design pattern.

I have only designed this solution to solve the issues at hand but I am aware that there are many possibilities in terms of promotions like the multibuy item could be an array of items. I therefore think that my code is tied a little too tightly the specific make-up of the promotion object. I am also aware that the promotion object has no behaviour and a struct or even a simple hash may be more appropriate but for simplicity and elegance I used an object in this instance.
