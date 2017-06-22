class Rose
  attr_reader :name, :product_code, :color, :quantity, :bundle_5, :bundle_10, :price_10, :price_5

  def initialize()
    @color = 'red'
    @name = 'Rose'
    @product_code = 'R12'
    @quantity = 0
    @save = false
    @bundle_5 = 0
    @bundle_10 = 0
    @price_5 = 6.99
    @price_10 = 12.99
  end

  def save_quantity(quantity) 
    if check_rose_quantity(quantity)
      @save = true
      @quantity = quantity
      bundles_of_10_count(quantity)
      bundles_of_5_count(quantity)
    else
      return false
    end
  end

  def saved?
    @save
  end

  def check_rose_quantity(quantity)
    divisible_by_5(quantity)
  end

  def total_price_roses
    ('%.2f' % [price_of_bundle_10 + price_of_bundle_5]).to_f
  end

  def price_of_bundle_10
    @bundle_10 * @price_10
  end

  def price_of_bundle_5
    @bundle_5 * @price_5
  end

  private

  def divisible_by_5(number)
    if (number % 5 == 0)
      return true
    else
      return false
    end
  end

  def bundles_of_10_count(number)
    if number >= 10
      @bundle_10 = number / 10
    else
      @bundle_10 = 0
    end
  end

  def bundles_of_5_count(number)
    @bundle_5 = 1 if number % 10 == 5
  end


end