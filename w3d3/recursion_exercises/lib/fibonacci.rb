def fibonacci_recursive(n)

  return [1] if n == 1
  return [1, 1] if n == 2
  sequence = fibonacci_recursive(n - 1)
  sequence + [sequence[-1] + sequence[-2]]
end

def fibonacci_iterative(n)
  Enumerator.new do |y|
    a = 1
    b = 1
    loop do
      y << a
      a, b = b, a + b
    end
  end.take(n)
end

def fibonacci_iterative2(n)
  result = []
  a = 1
  b = 1
  n.times do
    result << a
    a, b = b, a + b
  end
  result
end

p fibonacci_recursive(20)
p fibonacci_iterative(20)
p fibonacci_iterative2(20)