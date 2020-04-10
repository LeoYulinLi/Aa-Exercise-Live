# Also:
# # [1, 2, 3, 4] => [[1, 2], [2, 3], [3, 4]]
# def duos(string)
#   string.chars.each_cons(2).count { |(a, b)| a == b }
# end
def duos(string)
  count = 0
  (0...string.length - 1).each do |i|
    count += 1 if string[i] == string[i + 1]
  end
  count
end

# Also: sentence.split.map { |word| hash.fetch(word, word) }.join(" ")
def sentence_swap(sentence, hash)
  sentence.split.map do |word|
    if hash.has_key?(word)
      hash[word]
    else
      word
    end
  end.join(" ")
end

def hash_mapped(hash, proc, &block)
  hash.map { |k, v| [block.call(k), proc.call(v)] }.to_h
end

def counted_characters(string)
  hash = Hash.new(0)
  string.each_char { |char| hash[char] += 1 }
  hash.select { |k, v| v > 2 }.map { |k, v| k }
end

def triplet_true?(string)
  string.chars.each_cons(3).any? { |arr| arr.uniq.length == 1 }
end

def energetic_encoding(string, hash)
  string.split.map do |word| # did this to remove spaces
    word.chars.map { |char| hash.fetch(char, '?') }.join("") #check each char and encode
  end.join(" ")
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'
# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'
# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'
# p energetic_encoding('bike', {}) # '????'
# [1, 2, 3, 4].each_slice(2) => [[1, 2], [3, 4]]
def uncompress(string)
  string.chars.each_slice(2).map { |(letter, number)| letter * number.to_i }.join
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'
def conjunct_select(array, *procs)
  array.select { |ele| procs.all? { |proc| proc.call(ele) } }
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }
#
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]
def convert_pig_latin(sentence)
  sentence.split.map do |word|
    temp_word = ""
    if word.length < 3
      temp_word = word
    else
      if "aeiou".include?(word[0].downcase)
        temp_word = word + "yay"
      else
        idx = word.chars.find_index { |char| "aeiou".include?(char.downcase) }
        temp_word = word[idx..-1] + word[0...idx] + "ay"
      end
    end
    if word == word.capitalize #checking for capitalize
      temp_word.capitalize
    else
      temp_word
    end
  end.join(" ")
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"
def reverberate(sentence)
  sentence.split.map do |word|
    temp_word = ""
    if word.length < 3
      temp_word = word
    else
      if "aeiou".include?(word[-1].downcase)
        temp_word = word + word
      else
        idx = word.chars.rindex { |char| "aeiou".include?(char.downcase) }
        temp_word = word + word[idx..-1]
      end
    end
    if word == word.capitalize #checking for capitalize
      temp_word.capitalize
    else
      temp_word
    end
  end.join(" ")
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"
def disjunct_select(array, *procs)
  array.select { |ele| procs.any? { |proc| proc.call(ele) } }
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }
# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]
# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]
# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]


def alternating_vowel(sent)
  sent.split.map.with_index do |word, index|
    if index.even?
      i = word.chars.find_index { |char| "aeiou".include?(char) }
      word[i] = "" if i
    else
      i = word.chars.rindex { |char| "aeiou".include?(char) }
      word[i] = "" if i
    end
    word
  end.join(" ")
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sentence)
  sentence.split.map do |word|
    if "aeiou".include?(word[-1])
      word + word[-1]
    else
      word.chars.map { |char| "aeiou".include?(char) ? char + "b" + char : char }.join
    end
  end.join(" ")
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(string)
  counter = 1
  result = ""
  string.each_char.with_index do |char, i|
    if char != string[i + 1]
      result += "#{char}#{counter if counter > 1}"
      counter = 1
    else
      counter += 1
    end
  end
  result
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"