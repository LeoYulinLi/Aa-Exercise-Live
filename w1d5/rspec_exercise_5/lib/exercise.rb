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