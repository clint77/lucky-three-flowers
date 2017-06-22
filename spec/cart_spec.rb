require 'cart'
require 'rose'
require 'lily' 
require 'tulip'

describe Cart do
  subject(:cart)  { Cart.new() }
  subject(:rose)  { Rose.new() }
  subject(:lily)  { Lily.new() }
  subject(:tulip) { Tulip.new() }

  describe '#total' do
    it 'returns initial total price of all flowers of 0' do
      expect(cart.total).to eq 0
    end
  end

  describe '#get_total' do
    it 'returns the total price' do
      rose.save_quantity(15)
      lily.save_quantity(12)
      tulip.save_quantity(17)
      expect(cart.get_total(rose.total_price_roses, lily.total_price_lilies, tulip.total_price_tulips)).to eq 84.77
    end
  end
end

