require 'lily'

describe Lily do
  subject(:lily) { Lily.new() }

  describe '#name' do
    it 'returns the name' do
      expect(lily.name).to eq 'Lily'
    end
  end

  describe '#product_code' do
    it 'returns the product code for Lily' do
      expect(lily.product_code).to eq 'L09'
    end
  end

  describe '#quantity' do
    it 'returns the initial quantity of lilies of 0' do
      expect(lily.quantity).to eq 0
    end
  end

  describe '#save_quantity' do
    it 'saves quantity when it is divisible by 3' do
      lily.save_quantity(6)
      expect(lily.quantity).to eq 6
    end

    it 'will not save quantity when not divisible by 3' do
      lily.save_quantity(4)
      expect(lily.quantity).to eq 0
    end

    it 'will change #saved? to true if divisible by 3' do
      lily.save_quantity(6)
      expect(lily.saved?).to eq true
    end

    it 'will not change #saved? to true if not divisible by 3' do
      lily.save_quantity(4)
      expect(lily.saved?).to eq false
    end
  end

  describe '#saved?' do
    it 'initially returns false' do
      expect(lily.saved?).to eq false
    end
  end

  describe '#bundle_9' do
    it 'returns initial value of 0' do
      expect(lily.bundle_9).to eq 0
    end

    it 'returns value of 1 if number is 9' do
      lily.save_quantity(9)
      expect(lily.bundle_9).to eq 1
    end

    it 'returns value of 2 if number is 18' do
      lily.save_quantity(18)
      expect(lily.bundle_9).to eq 2
    end

    it 'returns value of 3 if number is 27' do
      lily.save_quantity(27)
      expect(lily.bundle_9).to eq 3
    end
  end

  describe '#bundle_6' do
    it 'returns an initial value of 0' do
      expect(lily.bundle_6).to eq 0
    end

    it 'returns value of 1 if number is 6' do
      lily.save_quantity(6)
      expect(lily.bundle_9).to eq 0
      expect(lily.bundle_6).to eq 1
    end

    it 'returns value of 1 if number is 15' do
      lily.save_quantity(15)
      expect(lily.bundle_9).to eq 1
      expect(lily.bundle_6).to eq 1
    end
  end

  describe '#bundle_3' do
    it 'returns initial value of 0' do
      expect(lily.bundle_3).to eq 0
    end

    it 'returns value of 1 if number is 3' do
      lily.save_quantity(3)
      expect(lily.bundle_3).to eq 1
      expect(lily.bundle_6).to eq 0
      expect(lily.bundle_9).to eq 0
    end
  end

  describe '#price_of_bundle_9' do
    it 'returns bundle of 9 x its price' do
      lily.save_quantity(9)
      expect(lily.price_of_bundle_9).to eq 24.95
      lily.save_quantity(18)
      expect(lily.price_of_bundle_9).to eq 49.90
    end
  end

  describe '#price_of_bundle_6' do
    it 'returns bundle of 6 x its price' do
      lily.save_quantity(6)
      expect(lily.price_of_bundle_6).to eq 16.95
      lily.save_quantity(15)
      expect(lily.price_of_bundle_6).to eq 16.95
    end
  end

  describe '#price_of_bundle_3' do
    it 'returns bundle of 3 x its price' do
      lily.save_quantity(3)
      expect(lily.price_of_bundle_3).to eq 6.99
      lily.save_quantity(12)
      expect(lily.price_of_bundle_3).to eq 6.99
    end
  end

  describe '#total_price_lily' do
    it 'returns total price of lilies' do
      lily.save_quantity(12)
      expect(lily.total_price_lilies).to eq 31.94
    end
  end


end

