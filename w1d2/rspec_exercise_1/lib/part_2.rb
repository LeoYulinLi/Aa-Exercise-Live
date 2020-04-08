def hipsterfy(word)
  index = word.chars.rindex { |char| "aeiou".include?(char) }

  word[index] = "" if index

  word
end

def vowel_counts(string)
  count = Hash.new(0)
  vowels = "aeiou"

  string.each_char do |char|
    if vowels.include?(char.downcase)
      count[char.downcase] += 1
    end
  end

  count
end

def caesar_cipher(string, num)
  lookup = [*"a".."z"].zip([*"a".."z"].rotate(num)).to_h
  string.chars.map { |char| lookup.fetch(char, char) }.join("")
end
