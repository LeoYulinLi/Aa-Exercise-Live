def my_uniq(array)
  result = Hash.new(0)

  array.each { |ele| result[ele] = 1 }
  result.keys
end

class Array
  def two_sum
    result = []
    (0...self.length).each do |index|
      ((index + 1)...self.length).each do |index2|
        result << [index, index2] if self[index] + self[index2] == 0
      end
    end
    result
  end
end


def transpose(rows)
  result = Array.new(rows.first.length) { Array.new(rows.first.length) }

  (0...rows.first.length).each do |j|
    (0...rows.length).each do |i|
      result[i][j] = rows[j][i]
    end
  end
  result
end

def stock_picker(prices)
  result = nil

  (0...prices.length).each do |s|
    (s + 1...prices.length).each do |e|
      if result.nil? 
        result = [s, e] if prices[e] - prices[s] > 0
      else
        result = [s, e] if prices[result[1]] - prices[result[0]] < prices[e] - prices[s]
      end
    end
  end
  result
end