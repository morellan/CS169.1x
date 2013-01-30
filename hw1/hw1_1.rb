def palindrome?(string)
  string = string.gsub(/[^a-zA-Z]/, '').downcase
  string == string.reverse
end

def count_words(string)
  x = {}
  string.gsub(/[^a-zA-Z\s]/, '').downcase.split(' ').each do |s|
    x[s] = 0 unless x[s]
    x[s] += 1
  end
  x
end