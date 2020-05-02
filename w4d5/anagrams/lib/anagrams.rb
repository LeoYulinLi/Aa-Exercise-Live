def first_anagram?(str1, str2)
  arr1 = str1.split("")
  ana1 = arr1.permutation(str1.length).to_a
  res1 = []
  ana1.each do |anagram|
    res1 << anagram.join("")
  end
  res1.include?(str2)
end

# p first_anagram?("acb", "abc")

def second_anagram?(str1, str2) # O(n^2)
  arr = str2.split("")
  str1.each_char do |char| # O(n)
    idx = arr.find_index(char) # O(n)
    if !idx.nil?
      arr.delete_at(idx)
    else
      return false
    end
  end
  arr.empty?
end

# p second_anagram?("elvis", "livess")

def third_anagram?(str1, str2)
  arr1 = str1.split("").sort
  arr2 = str2.split("").sort
  arr1 == arr2
end

# p third_anagram?("elvis", "lives")

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char do |char| # O(n)
    hash1[char] += 1 # O(1)
  end

  str2.each_char do |char| # O(n)
    hash2[char] += 1 # O(1)
  end

  hash1 == hash2

end

# p fourth_anagram?("elvis", "livess")

