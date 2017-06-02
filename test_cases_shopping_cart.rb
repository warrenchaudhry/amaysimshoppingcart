require "./shopping_cart"
require "./product"
require "test/unit"

class TestCasesShoppingCart < Test::Unit::TestCase

  def setup
    @ult_small = Product.new("ult_small", "Unlimited 1GB", 24.90)
    @ult_medium = Product.new("ult_medium", "Unlimited 2GB", 29.90)
    @ult_large = Product.new("ult_large", "Unlimited 5GB", 44.90)
    @one_gb = Product.new("1gb", "1 GB Data-pack", 9.90)
    @sc = ShoppingCart.new
  end

  def test_scenario1
    3.times do
      @sc.add(@ult_small)
    end
    @sc.add(@ult_large)
    assert_equal(94.70, @sc.total)
    assert_equal(@sc.items.size, 4)
  end

  def test_scenario2
    2.times do
      @sc.add(@ult_small)
    end
    4.times do
      @sc.add(@ult_large)
    end
    assert_equal(209.40, @sc.total)
    assert_equal(@sc.items.size, 6)
  end

  def test_scenario3
    @sc.add(@ult_small)

    2.times do
      @sc.add(@ult_medium)
    end
    assert_equal(84.70, @sc.total)
    assert_equal(@sc.items.size, 5)
  end

  def test_scenario4
    @sc.add(@ult_small)
    @sc.add(@one_gb, 'I<3AMAYSIM')
    puts "\nCart Items:\n"
    puts @sc.items_summary
    puts "Total Price is $#{("%.2f" % @sc.total)}\n"
    assert_equal(31.32, @sc.total)
    assert_equal(@sc.items.size, 2)
    assert_equal(@sc.with_promo_code, true)
  end

end
