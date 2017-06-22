class Cart
  attr_reader :total

  def initialize
    @total = 0
  end

  def get_total(flower1, flower2, flower3)
    @total = flower1 + flower2 + flower3
    return ('%.2f' % @total).to_f
  end

end

