require 'tulip'

describe Tulip do
  subject(:tulip) { Tulip.new() }

  describe '#name' do
    it 'returns the name' do
      expect(tulip.name).to eq 'Tulip'
    end
  end

  describe '#product_code' do
    it 'returns the product code' do
      expect(tulip.product_code).to eq 'T58'
    end 
  end

  describe '#quantity' do
    it 'returns the initial quantity of tulip of 0' do
      expect(tulip.quantity).to eq 0
    end
  end

  describe '#save_quantity' do
    it 'saves quantity when it is divisible by 5' do
      tulip.save_quantity(10)
      expect(tulip.quantity).to eq 10
    end

    it 'saves quantity when it is divisible by 3' do
      tulip.save_quantity(9)
      expect(tulip.quantity).to eq 9
    end

    it 'saves quantity if it can be group of either 3 or 5' do
      tulip.save_quantity(8)
      expect(tulip.quantity).to eq 8
      tulip.save_quantity(14)
      expect(tulip.quantity).to eq 14
    end


    it 'will not save if it cannot be a group of 3 or 5' do
      tulip.save_quantity(7)
      expect(tulip.quantity).to eq 0
    end

    it 'will change #saved? to true if input is valid' do
      tulip.save_quantity(8)
      expect(tulip.saved?).to eq true
    end
  end

  describe '#bundle_9' do
    it 'returns initial value of 0' do
      expect(tulip.bundle_9).to eq 0
    end

    it 'returns a value of 1 if input is 9' do
      tulip.save_quantity(9)
      expect(tulip.bundle_9).to eq 1
    end

    it 'returns a value of 2 if input is 18' do
      tulip.save_quantity(18)
      expect(tulip.bundle_9).to eq 2
    end

    it 'returns a value of 4 if input is 41' do
      tulip.save_quantity(41)
      expect(tulip.bundle_9).to eq 4
      expect(tulip.bundle_5).to eq 1
    end
  end

  describe '#bundle_5' do
    it 'returns initial value of 0' do
      expect(tulip.bundle_5).to eq 0
    end

    it 'returns a value of 1 if input is 5' do
      tulip.save_quantity(5)
      expect(tulip.bundle_5).to eq 1
    end

    it 'returns a value of 2 if input is 10' do
      tulip.save_quantity(10)
      expect(tulip.bundle_5).to eq 2
      expect(tulip.bundle_9).to eq 0
    end

    it 'returns a value of 1 if input is 14' do
      tulip.save_quantity(14)
      expect(tulip.quantity).to equal 14
      expect(tulip.bundle_9).to eq 1
      expect(tulip.bundle_5).to eq 1
    end

    it 'returns a value of 2 if input is 19' do
      tulip.save_quantity(19)
      expect(tulip.quantity).to eq 19
      expect(tulip.bundle_9).to eq 1
      expect(tulip.bundle_5).to eq 2
    end

    it 'returns a value of 2 if input is 28' do
      tulip.save_quantity(28)
      expect(tulip.quantity).to eq 28
      expect(tulip.bundle_5).to eq 2
      expect(tulip.bundle_9).to eq 2
    end
  end

  describe '#bundle_3' do
    it 'returns an initial value of 0' do
      expect(tulip.bundle_3).to eq 0
    end

    it 'returns value of 1 if input is 3' do
      tulip.save_quantity(3)
      expect(tulip.bundle_3).to eq 1
    end

    it 'returns value of 2 if input is 6' do
      tulip.save_quantity(6)
      expect(tulip.bundle_3).to eq 2
    end

    it 'returns a value of 1 if input is 17' do
      tulip.save_quantity(17)
      expect(tulip.quantity).to eq 17
      expect(tulip.bundle_9).to eq 1
      expect(tulip.bundle_5).to eq 1
      expect(tulip.bundle_3).to eq 1
    end
  end

  describe '#price_of_bundle_9' do
    it 'returns bundle of 9 x its price' do
      tulip.save_quantity(9)
      expect(tulip.price_of_bundle_9).to eq 16.95
      tulip.save_quantity(18)
      expect(tulip.price_of_bundle_9).to eq 33.90
    end
  end

  describe '#price_of_bundle_5' do
    it 'returns bundle of 5 x its price' do
      tulip.save_quantity(5)
      expect(tulip.price_of_bundle_5).to eq 9.95
      tulip.save_quantity(10)
      expect(tulip.price_of_bundle_5).to eq 19.90
    end
  end

  describe '#price_of_bundle_3' do
    it 'returns bundle of 3 x its price' do
      tulip.save_quantity(3)
      expect(tulip.price_of_bundle_3).to eq 5.95
      tulip.save_quantity(6)
      expect(tulip.price_of_bundle_3).to eq 11.90
    end
  end

  describe '#total_price_tulips' do
    it 'returns total price of tulips' do
      tulip.save_quantity(17)
      expect(tulip.total_price_tulips).to eq 32.85
    end
  end

end

