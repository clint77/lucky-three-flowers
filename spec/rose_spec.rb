require 'rose'

describe Rose do
  subject(:rose) { Rose.new() }

  describe '#name' do
    it 'returns the name' do
      expect(rose.name).to eq 'Rose'
    end
  end

  describe '#product_code' do
    it 'returns the product code' do
      expect(rose.product_code).to eq 'R12'
    end
  end

  describe '#quantity' do
    it 'returns initial quantity of roses of 0' do
      expect(rose.quantity).to eq 0
    end
  end

  describe '#save_quantity' do
    it 'saves quantity of roses entered' do
      rose.save_quantity(5)
      expect(rose.quantity).to eq 5
      rose.save_quantity(15)
      expect(rose.quantity).to eq 15
    end

    it 'will not save quantity not divisible by 5' do
      rose.save_quantity(6)
      expect(rose.quantity).to eq 0
    end

    it 'will change #saved? from false to true' do
      rose.save_quantity(5)
      expect(rose.quantity).to eq 5
      expect(rose.saved?).to eq true
    end
  end

  describe '#saved?' do
    it 'returns false initially' do
      expect(rose.saved?).to eq false
    end
  end

  describe '#check_rose_quantity' do
    it 'returns true if it is divisible by 5' do
      expect(rose.check_rose_quantity(5)).to eq true
    end

    it 'returns false if it is not divisible by 5' do
      expect(rose.check_rose_quantity(12)).to eq false
    end
  end

  describe '#bundle_5' do
    it 'returns an initial value of 0' do
      expect(rose.bundle_5).to eq 0
    end

    it 'returns 1 if quantity is 5' do
      rose.save_quantity(5)
      expect(rose.bundle_5).to eq 1
    end

    it 'returns 0 if quantity is 10' do
      rose.save_quantity(10)
      expect(rose.bundle_5).to eq 0
    end

    it 'returns 1 if number is 15' do
      rose.save_quantity(15)
      expect(rose.bundle_5).to eq 1
    end

    it 'returns 1 if number is 105' do
      rose.save_quantity(105)
      expect(rose.bundle_5).to eq 1
    end
  end

  describe '#bundle_10' do
    it 'returns an initial value of 0' do
      expect(rose.bundle_10).to eq 0
    end

    it 'returns a value of 1 if quantity is 10' do
      rose.save_quantity(10)
      expect(rose.bundle_10).to eq 1
    end

    it 'returns a value of 2 if quantity is 20' do
      rose.save_quantity(20)
      expect(rose.bundle_10).to eq 2
    end
  end

  describe '#price_of_bundle_10' do
    it 'returns bundle of 10 x its price' do
      rose.save_quantity(10)
      expect(rose.price_of_bundle_10).to eq 12.99
      rose.save_quantity(25)
      expect(rose.price_of_bundle_10).to eq 25.98
    end
  end

  describe '#price_of_bundle_5' do
    it 'returns bundle of 5 x its price' do
      rose.save_quantity(10)
      expect(rose.price_of_bundle_5).to eq 0
      rose.save_quantity(25)
      expect(rose.price_of_bundle_5).to eq 6.99
    end
  end

  describe '#total_price_roses' do
    it 'returns total price of roses' do
      rose.save_quantity(15)
      expect(rose.total_price_roses).to eq 19.98
    end
  end
end







