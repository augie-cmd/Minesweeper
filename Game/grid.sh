#! /bin/bash

## Handles creating a new grid.
generate_grid() {
	## ADD: input check
	readonly row_number=$1
	readonly column_number=$2
	readonly level=$3

	## ADD: grid_array readonly (after populated)
	readonly -a grid_array

	calculate_number_of_mines

	# for ((counter=1; counter<=$row_number; counter++))
		# do
			# Populate the array.

			# Level based on (grid size : mine)
			# How will mines be placed?

			# Next to mines, number placed on all
			# touching sides. Arrays above and below
			# will need to be compared.
		# done
}

calculate_number_of_mines() {
	declare -i number_of_mines

	# Number of mines are based on row_number,
	# column_number, and level.
	total_grid_locations=$(( row_number * column_number ))

	# NOTE: Update to CASE statement later.
	# FIX: Due to bash's floating point, the ratio needs a
	# different solution.
	if [ "$level" = 1 ]; then
		# number_of_mines=$((total_grid_locations / 3))
		# number_of_mines=$(bc <<< "$total_grid_locations / 3")
		number_of_mines=$(echo "scale=2;$total_grid_locations/3" | bc)

		echo ${number_of_mines}

	elif [ "$level" = 2 ]; then
		number_of_mines=$((total_grid_locations / (5/2)))
	elif [ "$level" = 3 ]; then
		number_of_mines=$((total_grid_locations / 2))
	fi
}

generate_grid "8" "4" "1"

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
