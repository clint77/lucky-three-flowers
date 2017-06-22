class Tulip
  attr_reader :name, :product_code, :quantity, :bundle_9, :price_9, :bundle_5, :price_5, :bundle_3, :price_3

  def initialize
    @name = 'Tulip'
    @product_code = 'T58'
    @quantity = 0
    @save = false
    @price_3 = 5.95
    @price_5 = 9.95
    @price_9 = 16.95
    @bundle_9 = 0
    @bundle_5 = 0
    @bundle_3 = 0
  end

  def save_quantity(quantity)
    if check_if_number_can_be_set_of_5_and_3(quantity)
      @quantity = quantity.to_i
      @save = true
      bundle_5_method(quantity)
      get_bundle_9(quantity)
      bundle_3_method(quantity)
    else
      return false
    end
  end

  def saved?
    @save
  end

  def total_price_tulips
    ('%.2f' % [price_of_bundle_9 + price_of_bundle_5 + price_of_bundle_3]).to_f
  end

  def price_of_bundle_9
    @bundle_9 * @price_9
  end

  def price_of_bundle_5
    @bundle_5 * @price_5
  end

  def price_of_bundle_3
    @bundle_3 * @price_3
  end

  private

  def check_if_number_can_be_set_of_5_and_3(number)
    return true if divisible_by_5(number)
    return true if divisible_by_3(number)
    return true if iterate_minus_5(number)
    return false
  end

  def divisible_by_5(number)
    if (number % 5 == 0)
      return true
    else
      return false
    end
  end

  def divisible_by_3(number)
    if (number % 3 == 0)
      return true
    else
      return false
    end
  end

  def iterate_minus_5(number)
    while number > 5
      return true if ( divisible_by_3(number - 5) )
      number -= 5
    end
    return false
  end

  def get_bundle_9(number)
    return @bundle_9 = ( (number -  5) / 9) if ( (number - 5) % 3) == 0
    return @bundle_9 = ( (number - 10) / 9) if ( (number -10) % 3) == 0
    return @bundle_9 = number / 9 if ( (number % 9) == 0)
  end
  
  def bundle_5_method(number)
    @bundle_5 = 1 if ( (number - 5)  % 3) == 0
    @bundle_5 = 2 if ( (number - 10) % 3) == 0 || number == 10
  end

  def bundle_3_method(number)
    @bundle_3 = (number - (@bundle_9 * 9) - (@bundle_5 * 5)) / 3
  end

end





