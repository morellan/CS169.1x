class String
  def sanitize
    self.downcase.chars.sort.join
  end
  def anagram?(word)
    self.sanitize == word.sanitize
  end
end

def combine_anagrams(words)
  anagrams = {}
  words.each do |w|
    w_s = w.sanitize
    anagrams[w_s] = [] unless anagrams.has_key?(w_s)
    anagrams.keys.each do |k|
      anagrams[k] << w if k.anagram?(w)
    end
  end
  anagrams.values
end