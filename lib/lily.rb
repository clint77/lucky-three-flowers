class Lily
  attr_reader :name, :product_code, :quantity, :bundle_9, :bundle_6, :bundle_3, :price_9, :price_6, :price_3

  def initialize
    @name = 'Lily'
    @product_code = 'L09'
    @quantity = 0
    @saved = false
    @price_3 = 6.99
    @price_6 = 16.95
    @price_9 = 24.95
    @bundle_9 = 0
    @bundle_6 = 0
    @bundle_3 = 0
  end

  def save_quantity(quantity)
    if divisible_by_3(quantity)
      @saved = true
      @quantity = quantity
      bundles_of_9_count(quantity)
      bundle_of_6_count(quantity)
      bundle_of_3_count(quantity)
    else
      return false
    end
  end

  def saved?
    @saved
  end

  def total_price_lilies
    ('%.2f' % [price_of_bundle_9 + price_of_bundle_6 + price_of_bundle_3]).to_f
  end

  def price_of_bundle_9
    @bundle_9 * @price_9
  end

  def price_of_bundle_6
    @bundle_6 * @price_6
  end

  def price_of_bundle_3
    @bundle_3 * @price_3
  end

  private 

  def divisible_by_3(number)
    if (number % 3 == 0)
      return true
    else
      return false
    end
  end

  def bundles_of_9_count(number)
    if number >= 9
      @bundle_9 = number / 9
    else
      @bundle_9 = 0
    end
  end

  def bundle_of_6_count(number)
    @bundle_6 = 1 if number % 9 == 6
  end

  def bundle_of_3_count(number)
    @bundle_3 = 1 if number % 9 == 3
  end


end