class Array
  def subsets
    return [self] if self.empty?
    temp = self[0...-1].subsets
    temp += temp.map {|ele| ele+[self.last]}
    temp 
  end
end

# subsets([]) # => [[]]

p [1, 2, 3].subsets