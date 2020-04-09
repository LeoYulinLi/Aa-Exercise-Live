def proper_factors(num)
  (1...num).select { |factor| num % factor == 0 }
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
  num == aliquot_sum(num)
end

def ideal_sequence
    Enumerator.new do |y|
        num = 1
        loop do   
            y << num if perfect_number?(num)
            num += 1
        end

    end

end



def ideal_numbers(num)
    ideal_sequence.take(num)
end