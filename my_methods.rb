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

  def my_all? 
    flag = true
    my_each { |element| flag &&= yield(element) }
    flag
  end

  def my_any? 
    false
    my_each {  |item| return true if yield(item) }
    
  end


  def my_none?
   result = true
    my_each { |item| result = false if yield(item) }
    result
  end

  def my_count(args = nil)
    array = self
    counter = 0
    if args.nil?
      array.my_each { counter += 1 }
    else
      array.my_each { |x| counter += 1 if x == args }
    end
    counter
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

  def my_inject(initial)
    result = initial || 0
    my_each do |element|
      result = yield(result, element)
    end
    result
  end
end