def average(num1, num2)
  sum = num1 + num2
  avg = sum / 2.0
  avg
end

def average_array(arr)
  arr.sum.to_f / arr.size
end


def repeat(string, num)
  string * num
end

def yell(string)
  "#{string.upcase}!"
end

def alternating_case(sentence)
  result = []
  words = sentence.split(" ")
  words.each_with_index do |word, index|
    if index.even?
      result << word.upcase
    else
      result << word.downcase
    end
  end
  result.join(" ")
end
