#! /bin/bash

# Note: Scope issues.

# generate_grid(row_number, column_number, level) {
	# declare -a grid_array=()
	# declare -i mine_number
	# 

	# for ((counter=1; counter<=$row_number; counter++))
		# do
			# Populate the array.

			# Level based on (grid size : mine)
			# How will mines be placed?

			# Next to mines, number placed on all
			# touching sides. Arrays above and below
			# will need to be compared.
		# done
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
