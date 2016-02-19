require "minitest/autorun"
require_relative "./gift"

describe Gift do
  before do
    @gift = Gift.new
  end
  
  describe 'load correct values from string' do
    it 'sets w,l,h correctly' do
      @gift.parse_line('21x23x49').must_equal [21, 23, 49]
    end
  end
  
  describe 'compute the present paper' do
    it 'calculates according to described function' do
      @gift.compute_present_paper(2, 3, 4).must_equal 52
      @gift.compute_present_paper(1, 1, 10).must_equal 42
    end
  end
  
  describe 'slack calculation' do
    it 'calculates the slack based on smallest face' do
      @gift.compute_slack(2, 3, 4).must_equal 6
      @gift.compute_slack(1,1,10).must_equal 1
    end
  end
  
  describe 'total amount of wrapping paper' do
    it 'sums all the amount based on the input' do
      @gift.total_wrap_paper.must_equal 1606483
    end
  end
  
  describe 'length for wrapping ribbon' do
    it 'calculates the length required for wrapping' do
      @gift.compute_ribbon_wrap(2,3,4).must_equal 10
      @gift.compute_ribbon_wrap(1,1,10).must_equal 4
    end
  end
  
  describe 'length for bow' do
    it 'calculates the length required for bow' do
      @gift.compute_bow(2,3,4).must_equal 24
      @gift.compute_bow(1,1,10).must_equal 10
    end
  end
  
  describe 'total ribbon length' do
    it 'calculates the sum of wrapping ribbon and bow length' do
      @gift.total_ribbon_length.must_equal 3842356
    end
  end

end