#! /bin/bash
# ADD: Lowercase detection and conversion (ASCII)

# . ./game_state.sh --source_only
. ./grid.sh --source_only

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
			# continue_game
			;;
		esac
}

read_coordinates() {
	echo "Enter row:"
	read row
	row_int=$(convert_alpha_to_int "$row")

	echo "Enter column:"
	read column
	column_int=$(convert_alpha_to_int "$column")
}

convert_alpha_to_int() {
	alpha_char=$1
	alpha_convert=$(printf $(printf '%d' "'$alpha_char"))
	alpha_corr=$((${alpha_convert}-65))

	echo "$alpha_corr"
}

place_flag() {
	## Place flag on grid unless location
	## already has a flag or is uncovered.
	## How? Unsure. (Color - display issue)
	read_coordinates

	add_flag "$row_int" "$column_int"

	# ADD: Invalid flag placement check
	# Add flag to grid printed to screen
	# NOTE: Will assume incoming letters are upcase.
	# 1. Find coordinates
	# 2. Add flag
}

uncover() {
	read_coordinates

	# uncover_location_on_print_grid(row, column)

	# ADD: Invalid uncover check
	# 1. Convert alpha to int
	# 2. Create 'row,column' string
	# 3. Is 'row,colum' win or lose?
	# 4. Process: If 0, uncover all touching 0s
	# if num > 0, reveal single location
	# continue/new_move
}