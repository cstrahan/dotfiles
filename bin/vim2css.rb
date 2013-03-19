#!/usr/bin/env ruby

require 'shellwords'
require 'fileutils'

VIM_THEME = ARGV.shift
BASENAME = File.basename(VIM_THEME, ".vim")
TMP_VIM = "/tmp/#{BASENAME}.vim"
PYGMENTS_STYLES = "/usr/local/lib/python2.7/site-packages/pygments/styles"

py = BASENAME + ".py"
css = BASENAME + ".css"

unless File.exist?(VIM_THEME)
  raise "Couldn't find file: #{VIM_THEME}"
end

# Dump the theme
FileUtils.rm(TMP_VIM) if File.exist?(TMP_VIM)
system "vim -c 'source #{VIM_THEME}' -c 'redir >> #{TMP_VIM.shellescape} | silent hi | redir END' -c 'q'"

# Clean the theme up for vim2pygments.py
lines = File.readlines(TMP_VIM)
lines = lines.map do |line|
  line = line.strip
  if line.empty?
    nil
  else
    "hi " + line
  end
end.compact

File.open(TMP_VIM, "w+") do |f|
  lines.each do |line|
    f.puts line
  end
end

# Convert to pygments style
puts "Generating #{py}"
system "vim2pygments.py #{TMP_VIM.shellescape} > #{py.shellescape}"

# Copy pygments style into styles directory
puts "Copying #{py} to #{File.join(PYGMENTS_STYLES, py)}"
FileUtils.cp(py, File.join(PYGMENTS_STYLES, py))

# Generate css
puts "Generating #{css} from style \"#{BASENAME}\""
system "pygmentize -S #{BASENAME.shellescape} -f html -a .highlight > #{css.shellescape}"

puts "Done!"
