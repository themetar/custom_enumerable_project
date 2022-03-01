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

  # Checks if no elements pass the condition
  def my_none?(&block)
    # flip #my_any?
    !self.my_any?(&block)
  end

  # Counts the elements that pass the condition
  def my_count
    return self.size unless block_given?

    count = 0
    self.my_each do |item|
      count += 1 if yield item
    end

    count
  end

  # Returns an array with the results of the block
  def my_map
    output = []
    self.my_each { |item| output << yield(item) }
    output
  end

  # Reduces an Enumerable to a single value
  def my_inject(initial)
    accumulator = initial
    self.my_each do |item|
      accumulator = yield accumulator, item
    end
    accumulator
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
