require 'minitest/autorun'

load 'hw1_3.rb'

describe "Homework 1, ex 3" do
  it "should define the method combine_anagrams" do
    Object.respond_to?(:combine_anagrams, true).must_equal true
  end

  it "should define the method anagram? for Strings" do
    "".must_respond_to :anagram?
  end

  it "should recognize an anagram correctly" do
    "asd".anagram?("dsa").must_equal true
    "creams".anagram?("scream").must_equal true
    # case insensitive
    "CaRs".anagram?("sacr").must_equal true
    "elgogo".anagram?("GooGle").must_equal true
  end

  it "should recognize a non anagram correctly" do
    "hola".anagram?("mundo").must_equal false
    # case insensitive
    "amazon".anagram?("ApPlE").must_equal false
  end

  it "should group anagram words in array" do
    words = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']

    combine_anagrams(words).sort.must_equal [
      ["cars", "racs", "scar"],
      ["four"],
      ["for"],
      ["potatoes"],
      ["creams", "scream"]
    ].sort

    # Just one anagram case insensitive
    words = ["HoLa", "LAOH", "aloh", "hola"]
    combine_anagrams(words).sort.must_equal [words].sort

    # No anagram
    words = ["1", "2", "3", "4"]
    combine_anagrams(words).sort.must_equal words.map { |w| [w] }.sort
  end
end