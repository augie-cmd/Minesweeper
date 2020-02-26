#! /bin/bash

. ./grid.sh --source_only
# . ./move.sh --source_only

## Responds to game's kickoff by generating
## a new grid, printing the grid to the screen,
## and calling continue(...) moving the game into
## the next state.
# https://stackoverflow.com/questions/12815774/importing-functions-from-a-shell-script
new() {
	# current_grid=grid.generate_grid()
	export_print_grid
	# continue(current_grid)
}

# continue(current_grid) {
	# move.next_move()

	# How to delegate moves? (add flag vs.
	# uncover)
# }

## Checks if game is lost. (Was a mine
## uncovered?)
# lose() {
	## ADD: Check logic.

	## if game is lost:
		# echo "You've activated a mine. Game over."
		# play_again()
	## else
		## return ["false"]
	## if
# }


## Checks if game is won. (Are all the mines
## discovered?)
# win() {
	## ADD: Check logic.

	## if game is won:
		# echo "Congratulations. Your field is safe."
		# play_again()
	## else
		## NOTE: bash returns function status.
		## Change this.
		## return ["false"]
	## fi
# }

# play_again() {
	# echo "War is hell."
    # echo "Play again? (y/n)"
    # read response

        # if[ "$response" = y ]; then
        ## minesweeper.sh; ADD: 'Clear' stack?
        # else
                # SIGINT OR SIGKILL process
        # fi
# }
