module Enumerable
  # Your code goes here
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
