# Amaysim Shopping Cart Exercise

| Product Code  | Product Name  | Price   |
|-------------- |-------------- | --------|
| ult_small     | Unlimited 1GB |   $24.90|
| ult_medium    | Unlimited 2GB |   $29.90|
| ult_large     | Unlimited 5GB |   $44.90|
| 1gb           | 1 GB Data-pack|    $9.90|

Test Scenarios:

* 3 x Unlimited 1GB + 1 Unlimited 5GB => `$94.70`

* 2 x Unlimited 1GB + 4 Unlimited 5GB => `$209.40`

* 1 x Unlimited 1GB + 2 Unlimited 2GB + 2 1GB Data Pack => `$84.70`

* 1 x Unlimited 1GB + 1 1GB Data Pack + Promo code => `$31.32`

***
Instructions

1. `git clone git@bitbucket.org:warren_chaudhry/amaysimshoppingcart.git`
2. `cd amaysimshoppingcart`

```shell

    $ cd amaysimshoppingcart
    $ irb
    2.3.3 :001 > load 'product.rb'
    2.3.3 :002 > load 'shopping_cart.rb'
    2.3.3 :003 > ult_small = Product.new("ult_small", "Unlimited 1GB", 24.90)
    2.3.3 :004 > ult_medium = Product.new("ult_medium", "Unlimited 2GB", 29.90)
    2.3.3 :005 > ult_large = Product.new("ult_large", "Unlimited 5GB", 44.90)
    2.3.3 :006 > one_gb = Product.new("1gb", "1 GB Data-pack", 9.90)
    2.3.3 :007 > cart = ShoppingCart.new
    2.3.3 :008 > cart.add(ult_small)
    2.3.3 :009 > cart.add(one_gb, 'I<3AMAYSIM')
    2.3.3 :010 > cart.items
    2.3.3 :011 > cart.total

```

3. To execute scenarios, run `ruby scenarios.rb`
4. To execute test cases, run `ruby test_cases_shopping_cart.rb`