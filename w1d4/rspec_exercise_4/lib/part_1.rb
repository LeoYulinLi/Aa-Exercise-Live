def my_reject(arr, &prc)
  result = []

  arr.each do |ele|
    result << ele unless prc.call(ele)
  end

  result
end

def my_one?(array, &prc)
  count = 0
  array.each do |ele|
    count += 1 if prc.call(ele)
  end
  count == 1
end

def hash_select(hash, &prc)
    result_hash = {}

    hash.each do |k, v|
        result_hash[k] = v if prc.call(k,v)
    end

    result_hash
end

def xor_select(array, proc1, proc2)
  array.select { |ele| proc1.call(ele) ^ proc2.call(ele) }
end

def proc_count(val, proc_arr)
    proc_arr.count {|proc| proc.call(val)}
end


