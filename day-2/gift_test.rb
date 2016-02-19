require "minitest/autorun"
require_relative "./gift"

describe Gift do
  before do
    @gift = Gift.new 'input'
  end

  describe 'unit test' do
    describe '#parse_line' do
      it 'sets w,l,h correctly' do
        @gift.parse_line('49x21x23').must_equal [21, 23, 49]
      end
    end
    
    describe 'compute the present paper' do
      it 'calculates according to described function' do
        @gift.compute_present_paper(2, 3, 4).must_equal 58
        @gift.compute_present_paper(1, 1, 10).must_equal 43
      end
    end
    
    describe 'length for wrapping ribbon' do
      it 'calculates the length required for wrapping' do
        @gift.compute_ribbon(2,3,4).must_equal 34
        @gift.compute_ribbon(1,1,10).must_equal 14
      end
    end
  end

  describe 'run with input' do
    before do
      @gift.run
    end
    
    describe 'total amount of wrapping paper' do
      it 'sums all the amount based on the input' do
        @gift.total_paper.must_equal 1606483
      end
    end
    
    describe 'total ribbon length' do
      it 'calculates the sum of wrapping ribbon and bow length' do
        @gift.total_ribbon.must_equal 3842356
      end
    end
  end
end