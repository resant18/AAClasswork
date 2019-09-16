require "byebug"

class MaxIntSet
  attr_reader :store

  def initialize(max)
    @max = max
    @store = []

  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store.delete_at(num)
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @max)
  end

  def validate!(num)    
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }    
  end

  def insert(num)
    idx = num % num_buckets    
    @store[idx] << num unless self.include?(num)
  end

  def remove(num)
    self[num].delete(num) if self.include?(num)      
  end

  def include?(num)    
    self[num].include?(num)    
  end

  private

  def [](num)
    # optional but useful; return the bucket (subarray) corresponding to `num`
    idx = num % num_buckets
    p @store[idx]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)

    # insert first then check the size and resize it
    self[num] << num
    @count += 1
    resize! if num_buckets < self.count

    num
  end

  def remove(num)
    @count -= 1 if self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num) 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    idx = num % num_buckets
    @store[idx]
  end

  def num_buckets
    @store.length
  end

  def resize!
    #double the buckets amount
    old_store = @store.dup
    @store = Array.new(2 * num_buckets) { Array.new }

    # reset before inserting the old data
    @count = 0
    # copy the old data to new resized buckets
    old_store.flatten.each do |num|
      insert(num)
    end

    p old_store
    p @store
  end

  
end
