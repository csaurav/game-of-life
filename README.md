conways-game-of-life
====================


General Game Rules:

    -Any live cell with fewer than two live neighbours dies, as if caused by under-population.

    -Any live cell with two or three live neighbours lives on to the next generation.

    -Any live cell with more than three live neighbours dies, as if by overcrowding.

    -Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

source:
http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life


Alive cells are represented by:  "X"

Dead cells are represented by: "0" 

For running the program: 

1. bundle install
2. ruby simulate.rb

For running the test case: 

1. rspec spec





