#!/usr/bin/env ruby
require 'fileutils'
require 'optparse'
require 'date'

MEMOIRB_DIR = '/home/romain/projets_ruby/memoirb/'
MEMOIRB_FILE = Time.now.strftime("%Y_%m_%d")

# create directory if not exists
FileUtils.mkdir_p MEMOIRB_DIR

date = Time.now.strftime("%A %d/%m/%Y %H:%M") + "\n" + "\n"
total_input = ''

# get user entry
while 1
    user_input = gets
    if user_input == "\n"
        break
    else
        total_input += '    ' + user_input
    end
end
total_input += "\n"

# write in file
if total_input.length > 0
    file = File.open(MEMOIRB_DIR + MEMOIRB_FILE, 'a')
    file.puts(date)
    file.puts(total_input)
    file.close()
end
