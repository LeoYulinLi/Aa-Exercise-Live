# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
  vowel = "aeiou".chars
  hash = {}
  words.each { |word| hash[word] = vowel_counts(word) }
    (0...hash.length).flat_map do |i|
        (i+1...hash.length).map do |j|
           [words[i], words[j]]
        end
    end.select { |(a, b)| vowel.all? { |v| (hash[a] + hash[b]).include?(v) } }
    .map { |pair| pair.join(" ") }

end

# [a, nil, nil, i, o, nil]
def vowel_counts(word)
  vowel = "aeiou"
  word.chars.select { |c| vowel.include?(c) }.uniq
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).any? { |n| num % n == 0 }
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    bigrams.select { |bigram| str.include?(bigram) }
end

class Hash
  # Write a method, Hash#my_select, that takes in an optional proc argument
  # The method should return a new hash containing the key-value pairs that return
  # true when passed into the proc.
  # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
  #
  # Examples:
  #
  # hash_1 = {x: 7, y: 1, z: 8}
  # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
  #
  # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
  # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
  # hash_2.my_select                            # => {4=>4}
  def my_select(&prc)
    prc ||= Proc.new {|k,v| k == v}
    self.select(&prc)
  end
end

class String
  # Write a method, String#substrings, that takes in a optional length argument
  # The method should return an array of the substrings that have the given length.
  # If no length is given, return all substrings.
  #
  # Examples:
  #
  # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
  # "cats".substrings(2)  # => ["ca", "at", "ts"]
  # "cats".chars.each_cons(2) => [["c", "a"], ["a", "t"], ["t", s]]
  def substrings(length = nil)  
    length ||= (1..self.length).to_a 

    return self.chars.each_cons(length).map(&:join) if length.is_a?(Integer)
    length.flat_map do |i|
        self.chars.each_cons(i).map(&:join)
    end
    
  end

  # maybe do somthing like if length is null => (1..self.length).map { |l| self.chars each cons thing}
  # else do the normal thing
  # nice lol
  
  # Write a method, String#caesar_cipher, that takes in an a number.
  # The method should return a new string where each char of the original string is shifted
  # the given number of times in the alphabet.
  #
  # Examples:
  #
  # "apple".caesar_cipher(1)    #=> "bqqmf"
  # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
  # "zebra".caesar_cipher(4)    #=> "difve"
  # a b c d
  # d a b c
  # [[a, d], [b, a], [c, b], [d, c]].to_h => {a => d, b => a, c => b, d => c}
  def caesar_cipher(num)
    lookup = ("a".."z").zip(("a".."z").to_a.rotate(num)).to_h
    self.chars.map {|char| lookup[char]}.join
  end
end
