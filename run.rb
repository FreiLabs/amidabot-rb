#!/usr/bin/env ruby

system "git pull"
puts "Making sure discordrb is installed"
system "gem install discordrb"
puts "Updating from git"
system "git pull"
puts "Updating system gems"
system "gem update --system"
puts "Updating non-system gems"
system "gem update"
puts "Running amidabot in a screen"
system "screen ruby amidabot.rb"
