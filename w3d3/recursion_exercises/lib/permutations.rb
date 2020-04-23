def permutation(array)
 return array if array.empty?
  p(arr[0...-1],arr[-1])
end

def p(arr, num)
    return num if arr.empty?
    p(sum_array,arr[-1]).map { |a| p(a, num) }
end 