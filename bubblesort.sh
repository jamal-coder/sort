#!/bin/bash
clear
# limit of inputs which can be changed to any here
limit=4

# Taking in Input from the user
echo "Enter $((limit+1)) integers"

for a in $(eval echo "{0..$limit}"); do
	read -p "No.$((a+1)) : " num
	array[$a]=$num
done
# Displaying array elements as entered by user
echo -e "Array as entered:\n ${array[@]}"

# Arranging the array elements in ascending order
# for this purpose we will use two loops to go through each
# element of array for ascending order
# This is the outer loop
for a in $(eval echo "{0..$limit}"); do
	# This is the inner loop
	for b in $(eval echo "{0..$limit}"); do
		# here we are checking if on element above the current element is greater then
		# current element
		if [[ ${array[$b]} -gt ${array[(($b+1))]} ]]; then
			# if so then we interchange the places of values of elements for ascending order
			# first we assign the current element value to a temp variable for interchange
			temp=${array[$b]}
			# Here we are assigning the next element value to the current value
			array[$b]=${array[(($b+1))]}
			# Here we are assigning the value of temporary variable to next element of array
			# So to complete the interchange
			array[(($b+1))]=$temp
		fi
	done
done

# And finally we are displaying the ascending values of array.
echo -e "Array in ascending order:\n${array[@]}"
