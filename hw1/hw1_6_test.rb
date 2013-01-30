require 'minitest/autorun'

load 'hw1_6.rb'

describe "Homework 1, ex 6" do
  describe Numeric do
    it "should support the dollars, euros, rupees, yen currencies" do
      [:dollars, :euros, :rupees, :yens].each do |currency|
        1.send(currency).must_be_kind_of Numeric
      end
    end

    it "should return the correct transformation" do
      {:dollars => 1, :euros => 1.292, :rupees => 0.019, :yens => 0.013}.each do |currency, conversion|
        [0, 1, 2, 5, 10, 999.2].each do |money|
          money.send(currency).must_equal money * conversion
        end
      end
    end

    it "should define the instance method in" do
      1.must_respond_to :in
    end

    it "should convert one currency to another" do
      5.rupees.in(:yen).must_be_within_delta 7.307, 0.001
      5.dollars.in(:euros).must_be_within_delta 3.869, 0.001
      10.euros.in(:rupees).must_be_within_delta 680.0, 0.001
    end
  end

  describe "Palindrome in String" do
    it "should define the instance method palindrome? in String" do
      "".must_respond_to :palindrome?
    end

    it "recognizes palindromes correctly [25 points]" do
      lines = ["A man, a plan, a canal -- Panama", "Madam, I'm Adam!", "Anita lava la tina"]
      lines.each { |l| l.palindrome?.must_equal true }
    end

    it "recognizes non palindromes correctly [25 points]" do
      lines = ["Abracadabra", "lorem Ipsum ()*** ", "Alguna palabra que no es palindromo"]
      lines.each { |l| l.palindrome?.must_equal false }
    end

    it "should define the instance method palindrome? in enumerables" do
      [].must_respond_to :palindrome?
      {}.must_respond_to :palindrome?
    end

    it "should recognizes palindromes on enumerables correctly" do
      [1,2,3,2,1].palindrome?.must_equal true
    end

    it "should recognizes non palindromes on enumerables correctly" do
      [1,2,3,4,5].palindrome?.must_equal false
    end

    it "should work with enumerators" do
      [1,2,3,3,2,1].map.palindrome?.must_equal true
      [1,2,3,4,5,6].map.palindrome?.must_equal false
    end
  end
end