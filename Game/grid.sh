#! /bin/bash

## Handles creating a new grid.
# NOTE: Address dependence on gobal variables.
generate_grid() {
	## ADD: Input check
	readonly row_number=$1
	readonly column_number=$2
	readonly level=$3

	## ADD: grid_array readonly, if possible (after populated)
	declare -a grid_array

	calculate_number_of_mines

	assign_mine_location

	assign_flag_location

	# Update: two-dimentional array, will use strings
	# for now.
	# http://tldp.org/LDP/abs/html/arrays.html
	# "Example 27-17"

	# for ((gg_counter=0; gg_counter<$row_number; gg_counter++))
	# do
	# done
}

calculate_number_of_mines() {
	# Number of mines are based on row_number,
	# column_number, and level.
	# Level based on (grid size : mine)
	total_grid_locations=$(( row_number * column_number ))

	# NOTE: Update to CASE statement later.
	# ADD: Arithmetic helper function.
	if [ "$level" = 1 ]; then
		local number_of_mines_float=`echo "$total_grid_locations*0.1" | bc`
	elif [ "$level" = 2 ]; then
		local number_of_mines_float=`echo "$total_grid_locations*0.20" | bc`
	elif [ "$level" = 3 ]; then
		local number_of_mines_float=`echo "$total_grid_locations*0.30" | bc`
	fi

	number_of_mines=${number_of_mines_float%.*}
}

assign_mine_location() {
	# mine_location_array will contain the coordinates
	# of the mines. Using string separated by comma to
	# record location for now.

	# declare -a mine_location_array ## Causes mine_location_array
	# to be local. Adding -g works but also raises invalid option error.
	# Creating mine_location_array w/o declare so assign_flag_location()
	# can access it for now.

	mine_location_array=()

	for ((aml_counter=0; aml_counter<$number_of_mines; aml_counter++))
	do
		local random_number_row=$RANDOM
		# ADD: Check if row is still available, retrieve
		# new random number if not available
		local random_number_column=$RANDOM
		# ADD: Check if column is still available, retrieve
		# new random number if not available

		local random_row=$(( random_number_row %= row_number))
		local random_column=$(( random_number_column %= column_number))

		mine_location="${random_row},${random_column}"

		mine_location_array[$aml_counter]=$mine_location
	done
}

assign_flag_location() {
	# Flag location is dependent on mine location.
	local current_mine_location_array=()
	flag_location_array=()

	# FIX: Nonexistent locations may be added.
	for ((afl_counter=0; afl_counter<${#mine_location_array[@]}; afl_counter++))
	do
		local current_mine_location=${mine_location_array[$afl_counter]}
		# echo "$current_mine_location"

		# Split mine coordinate into row and column and push into
		# array.
		IFS=',' read -ra current_mine_location_array <<< "$current_mine_location"

		for((fl_counter=0; fl_counter<8; fl_counter++))
		do
			# current_mine_location_array[0]-1
			# current_mine_location_array[1]-1

			# current_mine_location_array[0]-1
			# current_mine_location_array[1]

			# current_mine_location_array[0]-1
			# current_mine_location_array[1]+1

			# current_mine_location_array[0]
			# current_mine_location_array[1]-1

			# current_mine_location_array[0]
			# current_mine_location_array[1]+1

			# current_mine_location_array[0]+1
			# current_mine_location_array[1]-1

			# current_mine_location_array[0]+1
			# current_mine_location_array[1]

			# current_mine_location_array[0]+1
			# current_mine_location_array[1]+1
		done
	done
}

generate_grid "10" "15" "1"

## The grid printed to the screen will be
## different than the master grid generated.
## The printed grid will 'hid' covered locations,
## display flags on covered locations, and display
## a number on top of uncovered locations.
# generate_print_grid(row_number, column_number) {
	## Will use same data structure as generate_grid(...),
	## but will contain the display grid.
# }

# add_flag_to_print_grid(row, column, update) {
	## Add red X to position.
# }

# uncover_location_on_print_grid() {
	## if location's number is above 0,
	## just uncover location in printed grid.

	## if location's number is 0,
	## scan
# }

# Place mines, record locations. Generate row arrays and
# store row arrays inside master array.
# 0's fill other positions.
# Scan through arrays and replace 0 add 1 if position is
# adjacent to mine. X symbolizes a mine.
# Sign will increment by 1; sign surrounded by multiple
# mines will display correct number.
# Example process:

#   1 2 3 4
#   -------
# 1|1 1 1 0
# 2|1 X 1 0
# 3|1 1 1 0
# 4|0 0 0 0

# Mine Position (2,2)

# (1,1): (2-1, 2-1)
# (1,2): (2-1, 2-0)
# (1,3): (2-1, 2+1)
# -----------------
# (2,1): (2-0, 2-1)
# (2,3): (2-0, 2+1)
# -----------------
# (3,1): (2+1, 2-1)
# (3,2): (2+1, 2-0)
# (3,3): (2+1, 2+1)