#! /bin/bash/

# . ./game_state.sh --source_only
# . ./grid.sh --source_only

# Player has two options: uncover
# or add a flag to coordinate entered.

next_move() {
	echo "Select 1 or 2"
	echo "1. Place flag; 2. Uncover (1/2): "
	read move

	# if[ "$move" = 1]; then
		# ADD: Invalid placement check
		# place_flag()
	# fi

	# if[ "$move" = 2]; then
		# if[ win() = "false"] {
			# uncover()
		# }
	#fi

	case "$move" in
		1 )
			# place_flag()
			echo "move 1"
			;;
		2 )
			# if[ win() = "false"] {
				# uncover()
			# }
			echo "move 2"
			;;
		* )
			echo "Invalid selection."
			;;
		esac
	## If selection doesn't match
		## echo "Invalid selection."
	## call next_move()?
	## current call preserved in stack?

}

# place_flag() {
	## Place flag on grid unless location
	## already has a flag or is uncovered.
	## How? Unsure. (Color - display issue)

	# echo "Enter row (x):"
	# read row
	# echo "Enter column (y):"
	# read column

	# add_flag_to_print_grid(row, column)
# }

# uncover() {
	# echo "Enter row (x):"
	# read row
	# echo "Enter column (y):"
	# read column

	# uncover_location_on_print_grid(row, column)
# }