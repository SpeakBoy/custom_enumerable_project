module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    self.my_each do |elem|
      yield(elem, index)
      index += 1
    end
  end

  def my_select
    selected_arr = []
    self.my_each do |elem|
      if yield(elem)
        selected_arr.push(elem)
      end
    end
    selected_arr
  end

  def my_all?
    self.my_each do |elem|
      unless yield(elem)
        return false
      end
    end
    return true
  end

  def my_any?
    self.my_each do |elem|
      if yield(elem)
        return true
      end
    end
    return false
  end

  def my_none?
    self.my_each do |elem|
      if yield(elem)
        return false
      end
    end
    return true
  end

  def my_count
    if block_given?
      count = 0
      self.my_each do |elem|
        if yield(elem)
          count += 1
        end
      end
      return count
    end
    self.size
  end

  def my_map
    new_arr = []
    self.my_each do |elem|
      new_arr.push(yield(elem))
    end
    new_arr
  end

  def my_inject(initial_value)  
    final_value = initial_value
    self.my_each do |elem|
      final_value = yield(final_value, elem)
    end
    final_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      for elem in self
        yield(elem)
      end
    end
    self
  end
end
