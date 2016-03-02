require 'minitest/autorun'
require_relative './elves'

describe Elves do
  before do
    @elves = Elves.new
  end

  describe 'getting the input' do
    it 'parses a line into the l,w,h values' do
      @elves.parse_line('20x8x24').must_equal [20, 8, 24]
    end
  end

  describe 'total surface area' do
    it 'calculates the total area based on the l,w,h' do
      @elves.calculate_total_box_area([2, 3, 4]).must_equal 52
      @elves.calculate_total_box_area([1, 1, 10]).must_equal 42
    end
  end

  describe 'extra paper' do
    it 'calculate the area based on smalest side' do
      @elves.calculate_slack([2, 3, 4]).must_equal 6
      @elves.calculate_slack([1, 1, 10]).must_equal 1
    end
  end

  describe 'total paper for box' do
    it 'calculate total paper with slack' do
      @elves.calculate_total([2,3,4]).must_equal 58
      @elves.calculate_total([1,1,10]).must_equal 43
    end
  end

  describe 'calculate_total_order' do
    it 'computes the total area needed from the input file' do
      @elves.calculate_total_order('input').must_equal 1606483
    end
  end
end