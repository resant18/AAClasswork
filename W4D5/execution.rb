##################################################
# Find minimum number
# O(n^2) quadratic time
# O(n^2) quadratic space
##################################################

def my_min(list)
  min = list[0]
  (1...list.length).each do |i|    
    min = list[i] if list[i] < min        
  end
  min
end

a = [0, 3, 5, 4, -5, 10, 1, 90]
puts "My min: #{my_min(a)}"
puts "_" * 50

#######################################################
# Largest Contiguous Sub-sum
# Find the largest sum of contiguous numbers in array
#######################################################
# Phase I O(n^2) 
def largest_contiguous_sub_sum1(list)
  max = list[0]
  (0...list.length).each do |i|
    (i...list.length).each do |j|      
      sub_sum = list[i..j].sum      
      max = sub if sub >= max               
    end
  end
  max
end

# Phase II O(n)
def largest_contiguous_sub_sum2(list)  
  sum = 0
  list.inject(0) do |max, num|
    sum + num > num ? sum += num : sum = num
    sum > max ? sum : max
  end
end


a = [5, 3, -7]
b = [2, 3, -6, 7, -6, 7]
c = [-5, -1, -3]
puts "Phase II: #{largest_contiguous_sub_sum2(b)}"
# p largest_contiguous_sub_sum_2(c)