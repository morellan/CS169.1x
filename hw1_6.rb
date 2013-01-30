class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}

  def method_missing(method_id)
    singular_currency = method_id.to_s.singularize
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    currency = currency.to_s if currency.class == Symbol
    singular_currency = currency.singularize
    self / @@currencies[singular_currency]
  end
end

class String
  def singularize
    self.gsub(/s$/, '')
  end

  def palindrome?
    string = self.gsub(/[^a-zA-Z]/, '').downcase
    string == string.reverse
  end
end

module Enumerable
  def palindrome?
    if self.class == Enumerator
      arr = self.to_a
    else
      arr = self
    end
    arr == arr.reverse_each.map { |x| x }
  end
end