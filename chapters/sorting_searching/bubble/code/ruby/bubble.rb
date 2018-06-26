#!/usr/bin/env ruby

def bubble_sort(arr)
	for i in 0..arr.length - 1
		for k in 0..arr.length - 2
			if arr[k] > arr[k + 1]
				temp = arr[k + 1]
				arr[k + 1] = arr[k]
				arr[k] = temp
			end
		end
	end

	return arr
end

def main()
	range = [200, 79, 69, 45, 32, 5, 15, 88, 620, 125]	
	puts "The range before sorting is #{range}"
	range = bubble_sort(range)
	puts "The range after sorting is #{range}"
end

main()
