# Sudoku

A Ruby kata - Sudoku solver. Mine is the grid.rb. It can solve a simple sudoku puzzle if the numbers are fed into it as an array.

The sudoku.rb is a friend's. His is more functional, mine is more OOP, I think.

To use my solver, clone this repo, cd into it, open up irb and require the grid.rb file. Instantiate the grid, passing it the array of numbers, using 0 to replace any missing numbers. As well as the array, pass the grid a Cell - this will be turned into a Cell object.

    grid = Grid.new([4,0,2,0,0,1,8,7,6,3,0,8,0,0,5,0,9,4,6,0,9,4,0,8,3,0,5,0,3,1,0,6,4,0,0,0,2,4,5,9,0,7,1,6,3,9,0,7,2,0,3,5,4,8,0,9,0,8,0,2,0,0,0,1,8,3,0,4,9,6,5,2,5,2,4,1,3,6,9,0,7], Cell)
    grid.solve

This will return an array of all the answers.
