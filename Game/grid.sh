#! /bin/bash
# FIX: Scope
# ADD: check for largest grid size: 26 X 26

## Handles creating a new grid. Treat as constructor.
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

	print_grid

	for ((gg_counter=0; gg_counter<${#print_grid_array[@]}; gg_counter++))
	do
		echo "${print_grid_array[gg_counter]}"
	done
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
	local values_array=("-1,-1" "-1,0" "-1,1" "0,-1" "0,1" "1,-1" "1,0" "1,1")
	flag_location_array=()

	# FIX: Nonexistent locations may be added.
	for ((afl_counter=0; afl_counter<${#mine_location_array[@]}; afl_counter++))
	do
		local current_mine_location=${mine_location_array[$afl_counter]}
		# echo "$current_mine_location"

		# Split mine coordinate into row and column and push into
		# array.
		IFS=',' read -ra current_mine_location_array <<< "$current_mine_location"

		mine_location_x=current_mine_location_array[0]
		mine_location_y=current_mine_location_array[1]

		# ADD: Delegate to helper function.
		for ((va_counter=0; va_counter<${#values_array[@]}; va_counter++))
		do
			current_value=${values_array[$va_counter]}
			IFS=',' read -ra current_value_array <<< "$current_value"

			value_x=current_value_array[0]
			value_y=current_value_array[1]

			flag_location_x=$((mine_location_x+value_x))
			flag_location_y=$((mine_location_y+value_y))

			array_index=${#flag_location_array[@]}
			flag_location_array[$array_index]="${flag_location_x},${flag_location_y}"
		done
	done
}

# Generates the grid that the user will see.
# Note: During this first pass, I will only focus on creating the
# first printed grid. (Not updating the grid.)
print_grid() {
	alpha_column_string=""
	alpha_start_number=65 # In decimal
	first_row_string=""
	print_grid_array=()

	# https://stackoverflow.com/questions/12855610/shell-script-is-there-any-way-converting-number-to-char
	for ((acs_counter=0; acs_counter<${row_number}; acs_counter++))
	do
		alpha_char_number=$(( alpha_start_number + acs_counter ))

		current_char=" "
		current_char+=$(printf \\$(printf '%03o' ${alpha_char_number}))
		alpha_column_string+=${current_char}
	done

	print_grid_array[0]=${alpha_column_string}

	for ((fr_counter=0; fr_counter<((${row_number}+1)); fr_counter++))
	do
		# Resets row_string.
		row_string=""

		if [[ "$fr_counter" = "0" ]] || [[ "$fr_counter" = "$((row_number+1))" ]]
		then
			first_row_string+=" "
		else
			first_row_string+="_ "
		fi

		print_grid_array[1]=$first_row_string

		for ((ar_counter=0; ar_counter<=${row_number}; ar_counter++))
		do
			if [[ "$ar_counter" = "0" ]]
			then
				row_string+="|"
			else
				row_string+="_|"
			fi

			print_grid_array["$((fr_counter+1))"]=$row_string
		done
	done
}

generate_grid "10" "15" "1"