def descending_order(n)
  #...
  # Turn the numbers into an iterable array
  # Check if the array is longer than a length of 1
  # If the array has a length of 1, return the only element as a number
  # If the array is longer than 1, compare the first two numbers to see which one is greater
  # If the first number is greater than the second, leave it
  # If the second number is greater than the first, swap the numbers
  # Now compare the third number to the first number
  # If the third number is greater than the first, then swap the two numbers and move to the first and fourth number
  # If the third number is not greater than the first, check if it is greater than the second
  # If it is greater than the second, swap the two numbers and move on
  # if it is not greater than the second, move on
  split_up_number = n.to_s.split('')
  temp_num = 0
  if split_up_number.length > 1
    (1..split_up_number.length-1).each do |outer_index|
      (0..outer_index-1).each do |inner_index|
        right_num = split_up_number[outer_index]
        left_num = split_up_number[inner_index]
        if right_num > left_num
          temp_num = right_num
          split_up_number[outer_index] = left_num
          split_up_number[inner_index] = temp_num
        end
      end
    end
  else
    split_up_number[0].to_i
  end
  split_up_number.join("").to_i
end

p descending_order(123456789)
