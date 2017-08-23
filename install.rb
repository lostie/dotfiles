#!/usr/bin/env ruby
##
### from http://errtheblog.com/posts/89-huba-huba
##
home = File.expand_path('~')

Dir['etc/*'].each do |file|
  next if file =~ /install|readme/i
  target = File.join(home, ".#{File.basename(file)}")
  puts "Linking #{File.expand_path file} to #{target}"
  puts `ln -svfh #{File.expand_path file} #{target}`
end

puts "Configuring git to use custom global ignore file"
puts `git config --global core.excludesfile ~/.gitignore_global`
