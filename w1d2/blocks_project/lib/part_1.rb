def select_even_nums(array)
  array.select(&:even?)
end

def reject_puppies(arr)
  arr.reject { |ele| ele['age'] <= 2 }
end

def count_positive_subarrays(arrays)
  arrays.count { |array| array.sum > 0 }
end

def aba_translate(str)
  vowels = "aeiou"
  str.map do |char|
    if vowels.include?(char)
      "#{char}b#{char}"
    else
      char
    end
  end
end
