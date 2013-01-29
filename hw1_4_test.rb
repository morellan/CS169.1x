require 'minitest/autorun'

load 'hw1_4.rb'

describe "Homework 1, ex 4" do
  describe Dessert do
    subject { Dessert.new("Lemon Pie", 300) }

    it "should have getters and setters for name and calories" do
      name = "Cheesecake"
      calories = 10

      obj = Dessert.new(name, calories)
      obj.name.must_equal name
      obj.calories.must_equal calories

      obj = Dessert.new(name, calories)
      obj.name = "Other name"
      obj.name.must_equal "Other name"

      obj.calories = 10
      obj.calories.must_equal 10
    end

    it "should define the instance method healthy?" do
      subject.must_respond_to :healthy?
    end

    it "should return true if a dessert has less than 200 calories" do
      obj = Dessert.new("Pie", nil)
      obj.healthy?.must_equal false

      obj = Dessert.new("Pie", 0)
      obj.healthy?.must_equal true

      obj = Dessert.new("Pie", 100)
      obj.healthy?.must_equal true

      obj = Dessert.new("Pie", 200)
      obj.healthy?.must_equal false

      obj = Dessert.new("Pie", 300)
      obj.healthy?.must_equal false
    end

    it "should define the instance method delicious?" do
      subject.must_respond_to :delicious?
    end

    it "should return true for all desserts" do
      subject.delicious?.must_equal true
    end
  end

  describe JellyBean do
    subject { JellyBean.new("Jelly", 200, "Apple") }

    it "should be an instance of Dessert" do
      subject.must_be_kind_of Dessert
    end

    it "should define accessors for flavor" do
      flavor = "Cherry"
      obj = JellyBean.new(subject.name, subject.calories, flavor)
      obj.flavor.must_equal flavor

      obj = JellyBean.new(subject.name, subject.calories, flavor)
      obj.flavor = "Pinnapple"
      obj.flavor.must_equal "Pinnapple"
    end

    it "should modify delicious? to return false if the flavor is 'black licorice'" do
      obj = JellyBean.new(subject.name, subject.calories, 'black licorice')
      obj.delicious?.must_equal false

      subject.flavor = 'black licorice'
      subject.delicious?.must_equal false
    end

    it "should still return true for all other flavors and for all non-JellyBean desserts" do
      obj = JellyBean.new("Jelly jelly", 400, 'other flavor')
      obj.delicious?.must_equal true

      subject.delicious?.must_equal true
    end
  end
end