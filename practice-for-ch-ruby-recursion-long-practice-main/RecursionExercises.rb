# ## Warmup

# - Write a recursive method, `range`, that takes a start and an end and returns
#   an array of all numbers in that range, exclusive. For example, `range(1, 5)`
#   should return `[1, 2, 3, 4]`. If `end < start`, return an empty array.
# - Write both a recursive and an iterative method to sum an array.

def reg_range(start, stop) # return array (exclusive)
    return [] if stop < start || stop == start
    return [start] if stop == start + 1
    # memoization step

    x = range(start, stop - 1)
    x + [stop - 1]
end

#iterative
def iterative_range(start, stop) # return array (exclusive)
    return [] if stop < start || stop == start

    i = start
    output = []

    while i < stop
        output << i
        i += 1
    end
    output
end


def exponent(base, exp)
    return 1 if exp == 0
    return base if exp == 1

    x = exp(base, exp - 1)
    base * x
end

def exponent(base, exp)
    return 1 if exp == 0
    return base if exp == 1

    even = exponent(base, exp / 2) 
    odd = exponent(base, (exp - 1) / 2)

    if exp % 2 == 0
        return even ** 2
    else 
        return odd ** 2
    end
end

class Array
    def deep_dup

        return self if self.all? { |elem| !elem.is_a?(Array) }
        
        # arr.dup = output_arr
        output_arr = []

        i = 0
        while i < self.length
            if self[i].is_a?(Array)
                output_arr << self[i].deep_dup
            else
                output_arr << self[i]
            end
            i += 1
        end
        output_arr
    end
end
# arr1 = [1, 7, [4, [9, 12], 2], 6]
# dupe = arr1.deep_dup
# dupe[2] << 3
# puts dupe.inspect
# puts arr1.deep_dup.inspect

def fibs(n)

	return 0 if n == 0
	return [0] if n == 1

	seq = fibs(n - 1)
	seq << seq[-1] + seq[-2]
end

def binary_search(arr, target) # [3, 5, 7, 9], 5
    high = arr.length - 1
    mid = high / 2 # ind 1
    # return mid if arr.length == 1 && arr[0] == target
    # return nil if arr.length == 1 && arr[0] != target

    return mid if target == arr[mid]
    return nil if arr.length == 0

    if arr[mid] > target
        call_1 = binary_search(arr[0...mid], target)
        
        if call_1.nil?
            return nil
        else
            return call_1
        end
    else
        call_2 = binary_search(arr[mid+1..-1], target)

        if call_2.nil?
            return nil
        else
            return call_2 + mid+ 1

        end
    end
    
end

puts binary_search([1, 2, 3], 1) # => 0
puts binary_search([2, 3, 4, 5], 3) # => 1
puts binary_search([2, 4, 6, 8, 10], 6) # => 2
puts binary_search([1, 3, 4, 5, 9], 5) # => 3
puts binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
puts binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
puts binary_search([1, 2, 3, 4, 5, 7], 6) # => nil