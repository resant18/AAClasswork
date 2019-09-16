require "byebug"

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)    
    return false if include?(key)

    # insert first then check the size and resize it
    self[key] << key
    
    @count += 1
    resize! if num_buckets < self.count
    true

  end

  def include?(key)            
    self[key].include?(key) 
  end

  def remove(key)
    @count -= 1 if self[key].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    idx = num.hash % num_buckets
    # puts "idx = #{idx}"
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
  end
end
