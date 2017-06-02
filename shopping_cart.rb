class ShoppingCart
  attr_reader :cart_items, :with_promo_code

  def initialize
    @cart_items = []
    @items = []
    @with_promo_code = false
  end

  def add(item, promo_code = nil)
    @cart_items << item
    @with_promo_code = check_promo(promo_code) if promo_code
    puts "#{item.name} added to cart." + "#{@with_promo_code ? "'#{promo_code}' Promo Applied" : nil}"
  end

  def items
    items = @cart_items.clone
    new_cart_items = get_items_deal(items)
    new_cart_items
  end

  def items_summary
    item_list = []
    items.group_by{|i| i.name}.values.each do |item|
      item_list << "#{item.count} x #{item.first.name}"
    end
    return item_list.join("\n")
  end

  def total
    price = calculate_price(@cart_items)
    return price.to_f.round(2)
  end

  private

  def calculate_price(items)
    price = items.map(&:price).inject(0, &:+)
    price = get_cart_total(price)
    price *= 0.9 if @with_promo_code
    return price
  end

  def check_promo(promo_code)
    @with_promo_code ||= true if promo_code == 'I<3AMAYSIM'
  end

  def get_cart_total(price)
    total = price
    item_group = cart_items.group_by(&:code)
    item_group.map do |key, items|
      item_price = items.first.price
      item_code = items.first.code
      if items.size > 2 && item_code == "ult_small"
        discount = (items.size / 3) * item_price
        total -= discount
      elsif items.size > 3 && item_code == "ult_large"
        sale_price = 39.90
        variance = item_price - sale_price
        discount = items.size * variance
        total -= discount
      end
    end
    return total
  end

  def get_items_deal(items)
    items.select {|i| i.code == 'ult_medium' }.count.times do
      items << Product.new("1gb", "1 GB Data-pack", 9.90)
    end
    return items
  end
end
