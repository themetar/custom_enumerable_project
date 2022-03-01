module Enumerable
  # Yields to block for every element, passing both the element and an index
  def my_each_with_index
    if block_given?
      i = 0
      self.my_each do |item|
        yield item, i
        i += 1
      end
    end
    self  # return self
  end
end

class Array
  # Yields to block for every element of the array
  def my_each
    if block_given?
      i = 0
      while i < self.length
        yield self[i]

        i += 1
      end
    end

    self  # return self
  end
end
