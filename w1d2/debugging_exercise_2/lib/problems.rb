# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
def prime?(number)
  (2...number).none? { |n| number % n == 0 }
end

def factors(number)
  (1..number).select { |n| number % n == 0 }
end

def largest_prime_factor(num)
  factors(num).select { |n| prime?(n) }[-1]
end

def unique_chars?(string)
  string.chars.uniq.size == string.chars.size
end

def dupe_indices(arr)
  arr.map.with_index {|ele, idx| [ele, idx]}
     .each_with_object(Hash.new{ |h, k| h[k] = [] }) { |(ele, idx), acc| acc[ele] << idx }
     .select { |_, array| array.length > 1 }
end

def hasharr(arr)
    count = Hash.new(0)

    arr.each {|ele| count[ele] += 1}
    count
end

def ana_array(arr1, arr2)
    hash1 = hasharr(arr1)
    hash2 = hasharr(arr2)

    hash1 == hash2
end