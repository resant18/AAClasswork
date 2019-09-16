class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash    
    each_with_index.inject(0) do |result, (el, i)|
      result ^ (el.hash + i.hash)      
    end    
  end
end

class String
  def hash    
    # using the Array hash method defined above
    chars.map(&:ord).hash        
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
   0
  
   to_a.sort.map(&:hash).hash
        
  end
end
