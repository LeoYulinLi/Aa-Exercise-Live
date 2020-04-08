# a = ["a", "b", "c"]
# b = ["e", "f", "g"]
# a.zip(b) => [["a", "e"], ["b", "f"]...]

def palindrome?(str)
  (str.length - 1).downto(0).map { |i| str[i] }.zip(str.chars).all? { |a, b| a == b }
end

def substrings(str)
  result = []
  str.chars.each_with_index do |_, i|
    str.chars.each_with_index do |_, i1|
      result << str[i..i1] if i1 >= i
    end
  end
  result
end

def palindrome_substrings(str)
  substrings(str).select { |s| palindrome?(s) && s.length > 1 }
end
