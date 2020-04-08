def partition(arr, threshold)
  arr.each_with_object([[], []]) { |n, acc| n < threshold ? acc[0] << n : acc[1] << n }
end

def merge(hash1, hash2)
  merged = Hash.new
  hash1.each do |k, v|
    if hash2.has_key?(k)
      merged[k] = hash2[k]
    else
      merged[k] = v
    end
  end
  hash2.each do |k, v|
    if !merged.has_key?(k)
      merged[k] = v
    end
  end
  merged
end

def censor(str, arr)
    lowercase = arr.map {|word| word.downcase}
    str.split(" ").map {|word| lowercase.include?(word.downcase) ? beep(word) : word}.join(" ")
end

def beep(word)
    word.chars.map {|char| "aeiou".include?(char.downcase) ? "*" : char}.join
end


# 16 => 10000
# 15 => 01111
# -------------
# &     00000
# n & (n-1) == 0
def power_of_two?(num)

  return true if num == 1
  (1..num).each do |n| 
    if 2**n == num
      return true
    end
  end
  false
end