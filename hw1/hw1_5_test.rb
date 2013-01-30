require 'minitest/autorun'

load 'hw1_5.rb'

describe "Homework 1, ex 5" do
  describe "attr_accessor_with_history" do
    subject { Foo.new }

    before do
      class Bar
        attr_accessor_with_history :attribute
      end
    end

    it "should be defined" do
      Foo.must_respond_to :attr_accessor_with_history
      Bar.must_respond_to :attr_accessor_with_history
    end

    it "should define accessors for attr_accessor_with_history" do
      obj = Bar.new

      obj.must_respond_to :attribute
      obj.must_respond_to :attribute=

      obj.attribute = "something"
      obj.attribute.must_equal "something"
    end

    it "should define the method attr_history for any accessors" do
      obj = Bar.new
      obj.must_respond_to :attribute_history

      subject.must_respond_to :bar_history
    end

    it "should show an empty array if no value has been applied to an instance variable" do
      obj = Bar.new
      obj.attribute_history.must_equal [nil]

      subject.bar_history.must_equal [nil]
    end

    it "should show all values applied to an instance variable" do
      obj = Bar.new

      values = [1, Bar, "hello world", :symbol]
      values.each do |v|
        obj.attribute = v
      end

      obj.attribute_history.must_equal [nil] + values

      values = [obj.class, "Google", 0.88]
      values.each do |v|
        subject.bar = v
      end

      subject.bar_history.must_equal [nil] + values

      f = Foo.new
      f.bar = 1
      f.bar = 2
      f.bar_history.must_equal [nil, 1, 2]
    end

    it "should work with multiple accessors" do
      class MultipleAccessors
        attr_accessor_with_history :foo, :bar, :baz
      end

      ma = MultipleAccessors.new

      ma.foo = 1
      ma.foo = 2
      ma.foo_history.must_equal [nil, 1, 2]

      ma.bar = "hola"
      ma.bar = "mundo"
      ma.bar_history.must_equal [nil, "hola", "mundo"]

      ma.baz = 1
      ma.baz = Foo.class
      ma.baz = "word"
      ma.baz = :symbol
      ma.baz_history.must_equal [nil, 1, Foo.class, "word", :symbol]
    end
  end
end