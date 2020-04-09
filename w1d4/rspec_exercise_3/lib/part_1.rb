def is_prime?(num)
  return false if num < 2

  (2...num).each do |factor|
    return false if num % factor == 0
  end
  true
end

def primes(num)
  count = 1
  result = 2
  while count < num
    result += 1
    count += 1 if is_prime?(result)
  end
  result
end

def nth_prime(num)
  primes(num)
end

# y << 

def prime_sequence
  Enumerator.new do |y|
    count = 1
    loop do
      y << nth_prime(count)
      count += 1
    end
  end
end

# Kotlin
# a = [1, 2, 6, 5, 1, 100, 2]
# a.drop_while { |n| n <= 6 } => [5, 1, 100, 2]
# a.take_while { |n| n <= 6 } => [1, 2, 6]

def prime_range(min, max)
  prime_sequence.lazy.drop_while { |n| n < min }.take_while { |n| n <= max }.to_a
end
