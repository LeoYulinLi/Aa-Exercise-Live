def element_count(array)
  hash = Hash.new(0)
  array.each do |ele|
    hash[ele] += 1
  end
  hash
end

# if hash.has_key(k)
#   hash[k]
# else
#   k
# end
#
# hash.has_key(k) ? hash[k] : k
# hash.fetch(k, k)

def char_replace!(str, hash)
    (0...str.length).each do |idx|
        str[idx] = hash.fetch(str[idx], str[idx])
    end

    str
end


def product_inject(array)
  array.inject { |acc, ele| acc * ele }
end

