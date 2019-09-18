 module Enumerable
  def my_each
    for i in self
      yield (i)
    return to_enum unless block_given?
    end

  end

  def my_each_with_index &block
    count = 0
    for e in self
      yield(e, count) 
      count+=1
    return to_enum unless block_given?

    end
  end

  def my_select 
    
    result = []
    my_each { |element| result << element if yield(element) }
    result

  end

  def my_all?(value = nil)
    flag = true
    if value
      my_each { |element| flag &&= element == value }
    else
      my_each { |element| flag &&= yield(element) }
    end
    flag
  end

  def my_any?(value = nil)
    result = false
    if value
      my_each { |item| result = true if item == value }
    else
      my_each { |item| result = true if yield(item) }
    end
    result
  end

  def my_none?(value = nil)
    result = true
    if value
      my_each { |item| result = false if item == value}
    else
      my_each { |item| result = false if yield(item) }
    end
    result
  end
   
  def my_count value = nil
    count = 0
    self.my_each do|elem|
      if value 
        if elem == value 
          count += 1
        end
      elsif block_given? 
        count += 1 if yield elem
      else
        count = self.length
      end 
    end
        count
  end
   
  def my_map(proc = nil)
    result = []
    my_each do |element|
      result <<
        if proc
          proc.call(element)
        else
          yield(element)
        end
    end
    result
  end
      
  def my_inject(arg = nil)
    aux = self[0]
    value = 0
    self.my_each_with_index do |value, index|
      if index > 0
        aux = yield(aux,value)
      end
    end
    if arg
      a = 3.0
      b = 2.0
      if yield(a, b) == 5
        aux += arg
      elsif yield(a, b) == 6
        aux *= arg
      end
    else
      aux
    end
  end 
end