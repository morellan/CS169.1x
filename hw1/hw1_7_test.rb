require 'minitest/autorun'

load 'hw1_7.rb'

describe "Homework 1, ex 7" do
  describe CartesianProduct do
    it "must respond to each instance method" do
      cp = CartesianProduct.new
      cp.must_respond_to :each
    end

    it "must implement other enumerable methods" do
      cp = CartesianProduct.new
      cp.must_respond_to :map
      cp.must_respond_to :include?
      cp.must_respond_to :collect
    end

    it "must allow two array as parameters" do
      cp = CartesianProduct.new([], [])
    end

    it "must return an empty collection if one of the vectors are empty" do
      cp = CartesianProduct.new([], [1, 2])
      cp.map { |x| x }.must_equal []

      cp = CartesianProduct.new([1, 2], [])
      cp.map { |x| x }.must_equal []
    end

    it "must return the lenght of the product as the multiplication of the lenght of the parameters" do
      (1..5).each do |i|
        (1..3).each do |j|
          cp = CartesianProduct.new([:a] * i, [:b] * j)
          cp.to_a.length.must_equal i * j
        end
      end
    end

    it "must return the cartesian product of two vectors" do
      cp = CartesianProduct.new([1], [2])
      cp.map { |x| x }.must_equal [[1, 2]]

      cp = CartesianProduct.new([:a,:b], [4,5])
      cp.map { |x| x }.must_equal [[:a, 4], [:a, 5], [:b, 4], [:b, 5]]

      cp = CartesianProduct.new([:a, :b, :c], [4, 5])
      cp.map { |x| x }.must_equal [ [:a,4], [:a,5], [:b,4], [:b,5], [:c,4], [:c,5] ]
    end
  end
end