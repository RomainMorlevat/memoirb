#!/usr/bin/env ruby
require 'fileutils'
require 'optparse'
require 'date'

today = Time.now.strftime("%Y_%m_%d")
MEMOIRB_DIR = '/home/romain/projets_ruby/memoirb/'
MEMOIRB_FILE = "memoirb-" + today

# create directory if not exists
FileUtils.mkdir_p MEMOIRB_DIR

date = Time.now.strftime("%A %d/%m/%Y %H:%M") + "\n" + "\n"
total_input = ''

# for options parsed
options = {}

optparse = OptionParser.new do|opts|
    opts.banner = "Usage: memoirb.rb [options]"

    opts.on('-d', '--display [file]', 'display memoirb file for today or given date') do |file|
        if file != nil
            file = "memoirb-" + file
            options = {:display => file}
        else
            options = {:display => MEMOIRB_FILE}
        end
    end

    opts.on('-l', '--list [date]', 'List memoirb files for given YEAR, YEAR_MONTH') do |date|
        options = {:list => date}
    end

    opts.on( '-h', '--help', 'Display this screen' ) do
        puts opts
        exit
    end
end

optparse.parse!

if options[:display]
    if File.exist?(MEMOIRB_DIR + options[:display])
        file = File.open(MEMOIRB_DIR + options[:display], "r") { |file|
            puts(file.readlines())
        }
        exit
    else
        puts("No such file")
    end
elsif options[:list]
    file_list = Dir.entries(MEMOIRB_DIR)
    for f in file_list
        if f[0,8 + options[:list].length] == "memoirb-" + options[:list]
            puts(f)
        end
    end
else
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
end

