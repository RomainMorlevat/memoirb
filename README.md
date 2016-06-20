# memoirb
Minimal CLI diary inspired by thomasdziedzic/memoir but in ruby

It's an exercice for me to practice ruby before integrating French school « Le Wagon »

## Installation
Copy files in whatever folder you like.
Enter the folder path where you want to store your memoirb files in MEMOIRB_DIR
You can put an alias in you .bashrc, .zshrc, etc. like **alias m='~/.scripts/memoirb.rb'**

## Usage
Run memoirb by typing 'm' in a terminal.

## Optional arguments
* --help : dislay help message
* --list[=YEAR/=YEAR_MONTH] : list all memoirb files for given YEAR or YEAR_MONTH
* --display[=DATE] : display memoirb file for today or given date (YYYY_MM__DD)