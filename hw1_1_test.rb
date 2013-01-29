require 'minitest/autorun'

load 'hw1_1.rb'

describe "Homework 1, ex 1" do
  # palindrome?
  it "should be defined" do
    Object.respond_to?(:palindrome?, true).must_equal true
  end

  it "recognizes palindromes correctly [25 points]" do
    lines = ["A man, a plan, a canal -- Panama", "Madam, I'm Adam!", "Anita lava la tina"]
    lines.each { |l| palindrome?(l).must_equal true }
  end

  it "recognizes non palindromes correctly [25 points]" do
    lines = ["Abracadabra", "lorem Ipsum ()*** ", "Alguna palabra que no es palindromo"]
    lines.each { |l| palindrome?(l).must_equal false }
  end

  # count_words
  it "should be defined" do
    Object.respond_to?(:count_words, true).must_equal true
  end

  it "should return a Hash" do
    count_words("Hola mundo").class == Hash.class
  end

  it "counts the words properly [40 points]" do
    count_words("A man, a plan, a canal -- Panama".downcase).must_equal Hash['a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1]
    count_words("Madam, I'm Adam!".downcase).must_equal Hash['madam' => 1, 'im' => 1, 'adam' => 1]
    count_words("Doo bee doo bee doo".downcase).must_equal Hash['doo' => 3, 'bee' => 2]
    count_words("").must_equal Hash[]
  end

  it "is not sensitive to case [10 points]" do
    count_words("A man, a plan, a canal -- Panama").must_equal Hash['a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1]
    count_words("Madam, I'm Adam!").must_equal Hash['madam' => 1, 'im' => 1, 'adam' => 1]
    count_words("Doo bee doo bee doo").must_equal Hash['doo' => 3, 'bee' => 2]
  end
end