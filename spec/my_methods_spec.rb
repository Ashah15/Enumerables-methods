require '../my_methods'


RSpec.describe Enumerable do
  let(:test_array) { [2, 2, 2, 4, 8] }

  let(:test_array_1) { [1, 2, 3, 4] }

  let(:test_array_2) { [2, 2, 2, 5, 2] }

  describe '#my_each' do
    it 'returns each of the elements in the array' do
      expect(test_array_1.my_each { |element| element }).to eql(test_array_1)
    end
  end

  describe '#my_each_with_index' do
    it 'loop through each of the elements in the array and giving it access to it index' do
      expect(test_array_1.my_each { |element| element }).to eql(test_array_1)
    end
  end

  describe '#my_select' do
    it 'returns a new array where element satisfies condition given in the block.' do
      expect(test_array_2.my_select(&:even?)).to eql([2, 2, 2, 2])
    end
    it 'returns a new array where element satisfies condition given in the block.' do
      expect(test_array_2.my_select { |element| element }).to eql([2, 2, 2, 5, 2])
    end
  end
  
  describe "#my_all?" do
    it "tests my_all? method" do
      expect(array.my_all? do |x| x % 2 == 0 end).to eq(false)
    end
  end
        
  describe "#my_any?" do
    it "tests my_any? method" do
      expect(array.my_any? do |x| x % 2 != 0 end).to eq(true)
    end
  end
        
  describe "#my_none?" do
    it "tests my_none? method" do
      expect(array.my_none? do |x| x > 20 end).to eq(true)
    end
  end

  describe '#my_count' do
    it 'returns the frequency of element in array.return the array size if parameter is not given.' do
      expect(test_array_2.my_count(2) {}).to eql(4)
    end
  end

  describe '#my_inject' do
    it 'returns the accumulated result of operation performed on each element in
    the array with initial value given as parameter.' do
      expect(test_array_2.my_inject(1) { |res, ele| res + ele }).to eql(14)
    end
  end
end

  
