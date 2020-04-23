def range(first, last)

  result = []

  if first == last
    return result
  end
  result << first
    
  if first == last - 1
    return result
  end

  # return [first] if first == last - 1


  result += range(first + 1, last)

  
end

p range(1, 1) # []
p range(1, 2) # [1] # range(1, 2) first + range(2, 2) => []
p range(1, 5) # [1, 2, 3, 4]
p range(1, 10) # [1, 2, 3, 4]