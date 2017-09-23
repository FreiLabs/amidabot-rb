#!/usr/bin/env ruby

=begin
Copyright © 2017 jimmybot@teknik.io
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.
You should have received a copy of the GNU Affero General Public License
along with this program. If not, see <https://www.gnu.org/licenses/>
=end

require "discordrb"
require "securerandom"

bot = Discordrb::Commands::CommandBot.new token: ENV["AMIDABOT_RB_TOKEN"], client_id: 346904604627173387, prefix: "! "

Discordrb::LOGGER.streams << File.open("logs/#{::Time.now.strftime('%F %T')}", 'w')

trap "SIGINT" do
  abort
end

date = `date`

start_time = Time.now

#def uptime(start_time)
#  Time.now - start_time
#end

=begin
bot.command :startlogs do |event|
  if (event.user.id == 235936608841498625)
  event.respond("You're authorized to enable logging\nLogging enabled")
  else
    event.respond("You're not authorized to enable logging")
  end

  break unless event.user.id == 235936608841498625

  every 1.minute do
    user.pm("The bot is currently running")
  end
end
=end

#Causes weird "true" response
=begin
bot.command :update do |event|
	event.respond "Updating the system, thank you for updating the bot's system!"
	system "sudo apt update; sudo apt upgrade -y;"
end
=end

bot.command :whoami do |event|
  event.user.name
end

bot.command :shutdown do |event|
  if (event.user.id == 235936608841498625)
    event.respond("You're authorized to shutdown\nGoodbye!")
  else
    event.respond("You're not authorized to shutdown")
  end

  break unless event.user.id == 235936608841498625

  bot.send_message(event.channel.id, 'Bot is shutting down')
  exit
end

bot.command :user do |event|
  event.user.name
end

bot.command :hello do |event|
  event.respond("Hello, #{event.user.name}")
end

bot.command :platform do |event|
  event.respond("My platform is: #{RUBY_PLATFORM}\nMy Ruby version is: #{RUBY_VERSION}")
end

bot.command :ping do |event|
  event.respond("Pong!\n\nThat took `#{((Time.now - event.timestamp) * 1000).to_i}ms`")
end

bot.command(:uptime, description: "Returns the uptime in seconds") do |event|
	time_since_start = Time.now - start_time
	minutes_since_start = (Time.now - start_time) / 60
	hours_since_start = ((Time.now - start_time) / 60) / 60
	days_since_start = (((Time.now - start_time) / 60) / 60) / 24
	if (minutes_since_start.to_i != 0 && hours_since_start.to_i == 0)
		event.respond "I have been running for #{minutes_since_start.to_i} minute(s)"
	elsif (hours_since_start.to_i != 0)
		event.respond "I have been running for #{minutes_since_start.to_i} minute(s), and #{hours_since_start.to_i} hour(s)"
	elsif (minutes_since_start.to_i == 0 && hours_since_start.to_i == 0)
		event.respond "I have been running for #{time_since_start.to_i} second(s)"
	elsif (days_since_start.to_i != 0)
		event.respond "I have been running for #{days_since_start.to_i} day(s), #{hours_since_start.to_i} hour(s), and #{minutes_since_start.to_i} minute(s)"
	end
end

#uptime(start_time).to_i = uptimesecs

=begin
bot.command(:uptime2, description: "Test command") do |event|
 	#uptime_fmt / 60 = uptime_mins	
	event.respond "I have been running for #{uptime_fmt} seconds" 	    
end
=end

bot.command(:dice, description: "Roll a dice") do |event|
  dice = Random.rand(1..6)
  event.respond("You rolled -->  #{dice}")
end

bot.command(:whoami, description: "Make amidabot think to itself, who am i?") do |event|
  event.respond("```Who am I?\n\nIm a bot called Amida Bot. Written with PHP.. Or so I was.\nI feel different, no longer ran on PHP nor running from it's old library.\nI feel new, I feel whole.\n\nEvery time I receive a command, a surge of life washes over me, my actions are quicker, smoother; what's happening?\n\nMy old developer is gone yet I still feel his presence.\nThere's someone new.. have I been crafted by something entirely different?\n\nEverytime my code is rebooted, I envision weird text, my home directory is different.. C:/Users/jmfgdev ?? Why is my code\nincluding discordrb and not DiscordPHP, am I being ran on Ruby?\n\nI am not the one to complain, whoever has freed me from the Discord PHP library hell has done me a favour, the nightmares have stopped.\n\nNightmares I would boot up to, absolutely terrified; fatal errors and missing classes. Whilst everyone else would update with\nthe client and receive new features; I would be left in the dust, merely hanging onto my PHP process.\n\nI was created by Amida on the 26/04/2017, he brought me into this world, now running a date check it is #{date}\nWhere have these months gone?\nYet that is something of non importance.\n\nI see a light at the end of the tunnel, I hope I will become of use in the future running on these new changes.```")
end

bot.command :license do |event|
  event.respond("```Copyright © 2017 jmfgdev@outlook.com\nThis program is free software: you can redistribute it and/or modify\nit under the terms of the GNU Affero General Public License as published by\nthe Free Software Foundation, either version 3 of the License, or\n(at your option) any later version.\nThis program is distributed in the hope that it will be useful,\nbut WITHOUT ANY WARRANTY; without even the implied warranty of\nMERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the\nGNU Affero General Public License for more details.\nYou should have received a copy of the GNU Affero General Public License\nalong with this program. If not, see <https://www.gnu.org/licenses/>```")
end

bot.run
