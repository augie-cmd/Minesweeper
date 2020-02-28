#! /bin/bash/

# . ./game_state.sh --source_only
# . ./grid.sh --source_only

# Player has two options (if not win or lose:
# uncover or add a flag to coordinate entered.

next_move() {
	echo "Select 1 or 2"
	echo "1. Place flag; 2. Uncover (1/2): "
	read move

	case "$move" in
		1 )
			place_flag
			;;
		2 )
			echo "move 2"
			;;
		* )
			echo "Invalid selection."
			;;
		esac
}

read_row() {
	echo "Enter row (x):"
	read row
	echo "Enter column (y):"
	read column
}

place_flag() {
	## Place flag on grid unless location
	## already has a flag or is uncovered.
	## How? Unsure. (Color - display issue)
	read_row

	# ADD: Invalid flag placement check
	# Add flag to grid printed to screen
}

uncover() {
	read_row

	# uncover_location_on_print_grid(row, column)

	# ADD: Invalid uncover check
	# 1. Convert alpha to int
	# 2. Create 'row,column' string
	# 3. Is 'row,colum' win or lose?
	# 4. Process: If 0, uncover all touching 0s
	# if num > 0, reveal single location
	# continue/new_move
}