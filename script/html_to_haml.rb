##!/usr/bin/env ruby

puts "Finding all html.erb in app/views"
erb_files = Dir.glob("../app/views/**/*.html.erb")

puts erb_files
erb_files.each do |filename| 
  `html2haml #{filename} > #{filename.gsub("html.erb", "haml")}`
end
