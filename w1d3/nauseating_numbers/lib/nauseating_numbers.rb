def strange_sums(array)
  count = 0
  array.each_with_index do |n, i|
    array.each_with_index do |n1, i1|
      count += 1 if i1 > i && n + n1 == 0
    end
  end
  count
end

def pair_product(array, prod)
  array.each_with_index do |n, i|
    array.each_with_index do |n1, i1|
      return true if i1 > i && n * n1 == prod
    end
  end
  false
end

def rampant_repeats(string, hash)
  string.chars.map { |c| hash.has_key?(c) ? c * hash[c] : c }.join
end

def perfect_square?(num)
  result = sqrt(num)
  result.to_i == result
end

# 1 => [1] |1| yes
# 2 => [1, 2] |2| yes
# 3 => [1, 3] |2| no # 2 !> 2
# 4 => [1, 2, 3] |3| yes # 3 > 2
# 5 => [1, 5] |2| no # 2 !> 3
# 6 => [1, 2, 3, 6] |4| yes # 4 > 3
# 7 |2|
# 8 => [1, 2, 4, 8] |4| no # 4 !> 4

def factor_count(num)
  (1..num).count { |n| num % n == 0 }
end

def anti_prime?(num)
  divisors = (1..num).count { |n| num % n == 0 }
  divisors > (1...num).map { |n| factor_count(n) }.max
end

#[1,242, 3, 4].each_slice(2) => [[1,242], [3,4]]

def matrix_addition(matrix1, matrix2)
  length = matrix1[0].length
  matrix1.flatten.zip(matrix2.flatten).map { |(a, b)| a + b }.each_slice(length).to_a
end

def factors(num)
  (1..num).select { |n| num % n == 0 }
end

# [[1, 2], [1, 2, 3, 6]]

def mutual_factors(*nums)
  counters = Hash.new(0)
  nums.map { |n| factors(n) }.flatten.each { |f| counters[f] += 1 }
  counters.select { |_, v| v == nums.length }.map { |k, _| k }
end

def tribonacci_sequence
  Enumerator.new do |y|
    a = b = 1
    c = 2
    loop do
      y << a
      a, b, c = b, c, a + b + c
    end
  end
end

# tribonacci_sequence(6) => [1, 1, 2, 4, 7, 13]
# tribonacci_sequence.inject([1, 1, 2]) { |acc, ele| c = acc[1] + acc[2] + ele ; [acc[1], acc[2], c] }

def tribonacci_number(n)
  tribonacci_sequence.take(n)[-1]
end

def matrix_addition_reloaded(*matrices)
  matrices.each_with_index do |m, i|
    matrices.each_with_index do |m1, i1|
      return nil if i1 > i && m.length != m1.length
    end
  end

  matrices.inject { |acc, matrix| matrix_addition(acc, matrix) }
end
