def zip(*arrays)
  arrays.inject { |acc, arr| acc.zip(arr).map(&:flatten) }
end

def prizz_proc(array, proc1, proc2)
  result = []
  array.each do |ele|
    result << ele if proc1.call(ele) != proc2.call(ele)
  end
  result
  # array.select { |ele| proc1.call(ele) != proc2.call(ele) }
end

def zany_zip (*arrays)
  max_length = arrays.map(&:length).max
  # result = arrays.map do |arr|
  #     new_array = Array.new(max_length)
  #     arr.each_index do |i|
  #         new_array[i] = arr[i]
  #     end
  #     new_array
  # end
  result = arrays.map do |arr|
    while arr.length != max_length
      arr << nil
    end
    arr
  end
  zip(*result)
end

def maximum(arr, &proc)
  arr.reverse.max_by(&proc)
end


def my_group_by(array, &block)
  result = Hash.new { |hash, key| hash[key] = [] }

  array.each do |ele|
    result[block.call(ele)] << ele
  end

  result
end

# def max_tie_breaker(array, proc, &block)
#   hash def max_tie_breaker(array, proc, &block)
#   hash = Hash.new(-1)
#   max = 0
#   array.each_with_index do |ele, index|
#     hash[index] = block.call(ele)
#     max = hash[index] if hash[index] > max
#   end
#   s1 = hash.select{|k,v| v == max}
#   s2 = s1.map{ |(i,size)| array[i] }
#   s3 = s2.max_by(&proc) #hash.select chooses the key value pairs that happen to be maxes after the block operation is performed  #map makes an array of the original values that happen to be maximums of the block operation #max_by performs a tie breaker on those original values and returns the first largest of the evaluations
# #   # when chaning functions, you always return the last evaluation.
#
# end

def max_tie_breaker(array, tie_breaker, &evaluator)
  array.reverse.sort_by(&tie_breaker).reverse.max_by(&evaluator)
end

def silly_syllables(sent)
  sent.split.map do |word|
    left_index = word.chars.find_index {|char| "aeiou".include?(char)} #find_index finds the first index for the block condition
    right_index = word.chars.rindex {|char| "aeiou".include?(char)} #rindex = find last index for block condition
    if left_index == right_index
      word
    else
      word[left_index..right_index]
    end
  end.join(" ") # this is possible because do...end is a block
end

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