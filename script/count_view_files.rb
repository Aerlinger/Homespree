##!/usr/bin/env ruby

erb_files = Dir.glob("../app/views/**/*.haml")
puts "Number of haml views: #{erb_files.length}"
