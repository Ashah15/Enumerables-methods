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

  
