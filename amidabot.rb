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

bot = Discordrb::Commands::CommandBot.new token: ENV["AMIDABOT_RB_SECRET"], client_id: 346904604627173387, prefix: "! "

trap "SIGINT" do
  abort
end

date = `date`

start_time = Time.now

uptime_uptime = uptime(start_time).to_i

bot.command :startlogs do |event|
  if (event.user.id == 235936608841498625)
  event.respond("You're authorized to enable logging\nLogging enabled")
  else
    event.respond("You're not authorized to enable logging")
  end

  break unless event.user.id == 235936608841498625

  every 1.minute do
    event.user.pm("The bot is currently running")
  end
end

def uptime(start_time)
  Time.now - start_time.to_i
end

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
  if (uptime(start_time).to_i < 60)
    event.respond("I have been running for #{uptime_uptime} seconds.")
  elsif (uptime > 60)
    event.respond("I have been running for more than a minute, specifically #{uptime_uptime} seconds.")
  elsif (uptime(start_time).to_i > 3600)
    event.respond("I've been running for more than an hour, specifically #{uptime_uptime} seconds.")
  end
end

bot.command(:dice, description: "Roll a dice") do |event|
  dice = Random.rand(1..6)
  event.respond("You rolled -->  #{dice}")
end

bot.command(:whoami, description: "Make amidabot think to itself, who am i?") do |event|
  event.respond("```Who am I?

Im a bot called Amida Bot. Written with PHP.. Or so I was.
I feel different, no longer ran on PHP nor running from it's old library.
I feel new, I feel whole.

Every time I receive a command, a surge of life washes over me, my actions are quicker, smoother; what's happening?

My old developer is gone yet I still feel his presence. 
There's someone new.. have I been crafted by something entirely different?

Everytime my code is rebooted, I envision weird text, my home directory is different.. C:/Users/jmfgdev ?? Why is my code 
including discordrb and not DiscordPHP, am I being ran on Ruby?

I am not the one to complain, whoever has freed me from the Discord PHP library hell has done me a favour, the nightmares have stopped.

Nightmares I would boot up to, absolutely terrified; fatal errors and missing classes. Whilst everyone else would update with 
the client and receive new features; I would be left in the dust, merely hanging onto my PHP process.

I was created by Amida on the 26/04/2017, he brought me into this world, now running a date check it is #{date}

Where have these months gone? 
Yet that is something of non importance.

I see a light at the end of the tunnel, I hope I will become of use in the future running on these new changes.```")
end

bot.command :license do |event|
  event.respond("```
Copyright © 2017 jmfgdev@outlook.com
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
```")
end

bot.run