require_relative '../my_methods'

RSpec.describe Enumerable do
  let(:test_array) { [2, 2, 2, 4, 8] }

  let(:test_array_1) { [1, 2, 3, 4] }

  let(:test_array_2) { [2, 2, 2, 5, 2] }

  describe '#my_each' do
    it 'returns each of the elements in the array' do
      expect(test_array_1.my_each { |element| element }).to eql(test_array_1.each { |element| element })
    end
  end

  describe "#my_each_with_index" do
    it "tests my_each_with_index method with a hash" do
      test = Hash.new
      expect(test_array.my_each_with_index do |value, index|test[index] = value if value > 5 end).to eq(test_array.each_with_index do |value, index|test[index] = value if value > 5 end)
    end
  end

  describe '#my_select' do
    it 'returns a new array where element satisfies condition given in the block.' do
      expect(test_array_2.my_select(&:even?)).to eql(test_array_2.select(&:even?))
    end
    it 'returns a new array where element satisfies condition given in the block.' do
      expect(test_array_2.my_select { |element| element }).to eql(test_array_2.select { |element| element })
    end
  end
  
  describe "#my_all?" do
    it "tests my_all? method with an argument given" do
      expect(test_array.my_all?(2)).to eq(test_array.all?(2))
    end

    it "returns false if condition doesn't hold for all elements" do
      expect(test_array.my_all? do |x| x % 2 == 0 end).to eq(test_array.all? do |x| x % 2 == 0 end)
    end
  end
        
  describe '#my_any?' do
    it 'returns true if condition hold for any elements' do
      expect(test_array.my_any?(&:even?)).to eql(test_array.any?(&:even?))
    end
    
    it 'returns true if condition hold for any elements with argument given' do
      expect(test_array.my_any?(9)).to eql(test_array.any?(9))
    end
  end
        
  describe "#my_none?" do
    it "tests my_none? method with an argument" do
      expect(test_array.my_none?(2)).to eq(test_array.none?(2))
    end

    it "tests my_none? method with a block given" do
      expect(test_array.my_none? do |x| x > 20 end).to eq(test_array.none? do |x| x > 20 end)
    end

    it "tests my_none? method with a block given" do
      expect(test_array.my_none? do |x| x < 4 end).to eq(test_array.none? do |x| x < 4 end)
    end
  end

  describe '#my_count' do
    it 'returns the frequency of element in array.return the array size if parameter is not given.' do
      expect(test_array_2.my_count(2)).to eql(test_array_2.count(2))
    end
    it "tests my_count method with a block given" do
      expect(test_array.my_count do |x| x > 5 end).to eq(test_array.count do |x| x > 5 end)
    end
  end

  describe "#my_map" do
    it "tests my_map method" do
      expect(test_array.my_map do |x| x * 2 end).to eq(test_array.map do |x| x * 2 end)
    end
  end

  describe '#my_inject' do
    it "tests my_inject method by addition" do
      expect(test_array_1.my_inject { |product, n| product + n }).to eq(test_array_1.inject { |product, n| product + n })
    end
    
    it "tests my_inject method by addition with argument given" do
      expect(test_array_1.my_inject(4) { |product, n| product + n }).to eq(test_array_1.inject(4) { |product, n| product + n })
    end
    
    it 'tests my_inject method by subtraction.' do
      expect(test_array_2.my_inject { |res, ele| res - ele }).to eql(test_array_2.inject { |res, ele| res - ele })
    end
    
    it 'tests my_inject method by multiplication' do
      expect(test_array_1.my_inject { |res, ele| res * ele }).to eql(test_array_1.inject { |res, ele| res * ele })
    end
    
    it 'tests my_inject method by multiplication with an argument given' do
      expect(test_array_2.my_inject(6) { |res, ele| res * ele }).to eql(test_array_2.inject(6) { |res, ele| res * ele })
    end
  end
end