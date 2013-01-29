class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  @@current_currency = 'dollar'

  def method_missing(method_id)
    singular_currency = method_id.to_s.singularize
    if @@currencies.has_key?(singular_currency)
      self.in(singular_currency)
    else
      super
    end
  end

  def in(currency)
    currency = currency.to_s if currency.class == Symbol
    singular_currency = currency.singularize
    conversion = @@currencies[@@current_currency] / @@currencies[singular_currency]
    @@current_currency = 'dollar'

    self * conversion
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
    self == self.reverse_each.map { |x| x }
  end
end