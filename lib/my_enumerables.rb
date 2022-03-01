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

  # Selects elements for which the block returns truthy value
  def my_select
    if block_given?
      result = []
      self.my_each do |item|
        result << item if yield item
      end
      return result
    end
  end

  # Checks if all elements match the condition
  def my_all?
    self.my_each do |item|
      check = block_given? ? yield(item) : item # use the element itself if no block is given
      return false unless check
    end
    true  # all passed if the program got here 
  end

  # Checks whether any element matches the condition
  def my_any?
    self.my_each do |item|
      check = block_given? ? yield(item) : item
      return true if check
    end
    false # none passed the test if the program got here 
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
