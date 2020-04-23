class Array
  def deep_dup
    self.map do |ele|
      if ele.is_a?(Array)
        ele.deep_dup
      else
        ele.dup
      end
    end
  end
end
p [1, 2, 3, [2, 3, 4, [5, 6, 7]], 90].deep_dup

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.deep_dup

# shouldn't modify robot_parts
robot_parts_copy[1] << "LEDs"
p robot_parts_copy[1]
# and it doesn't
p robot_parts[1] # => ["capacitors", "resistors", "inductors"]


# a = ["asfd", "qwer"]
# b = a.dup

# p a[0].object_id
# p b[0].object_id

# a[0] << "asdfasdfad"
# a[0] = "asdfaasdf"
# p b[0]

# p a.object_id
# p b.object_id


# a = ["asfd", "qwer"]
# b = a.dup

# p a[0].object_id
# p b[0].object_id

# p a[0].object_id == b[0].object_id ? "same" : "different"

# a = ["1", "2", "3"]
# b = a.dup

# a[0] << "5"

# p b

# str_a = "hi"
# str_b = str_a.dup

# str_b << "ll"

# p str_a