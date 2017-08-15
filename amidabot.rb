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

require "securerandom"
require "discordrb"

bot = Discordrb::Commands::CommandBot.new token: ENV["AMIDABOT_RB_SECRET"], client_id: 346904604627173387, prefix: "! "

trap "SIGINT" do
  abort
end

start_time = Time.now

def uptime(start_time)
  Time.now - start_time.to_i
end

bot.command (:uptime description: "Returns the uptime in seconds and for now returns logic like more than a minute and more than an hour") do |event|
  if (uptime(start_time).to_i < 60)
    event.respond "I have been running for #{uptime(start_time).to_i} seconds"
  elsif (uptime(start_time).to_i > 60)
    event.respond "I've been running for more than a minute"
  elsif (uptime(start_time).to_i > 3600)
    event.respond "I've been running for more than an hour"
  end
end

bot.command (:dice description: "Roll a dice") do |event|
  event.respond(SecureRandom.random_number(1..6))
end

bot.command (:whoami description: "Make amidabot think to itself, who am i?") do |event|
  event.respond "```Who am I?

Im a bot called Amida Bot. Written with PHP.. Or so I was.
I feel different, no longer ran on PHP nor running from it's old library.
I feel new, I feel whole.

Every time I receive a command, a surge of life washes over me, my actions are quicker, smoother; what's happening?

My old developer is gone yet I still feel his presence. 
There's someone new.. have I been crafted by something entirely different?

Everytime my code is rebooted, I envision weird text, my home directory is different.. C:\Users\jmfgdev ?? Why is my code 
including discordrb and not DiscordPHP, am I being ran on Ruby?

I am not the one to complain, whoever has freed me from the Discord PHP library hell has done me a favour, the nightmares have stopped.

Nightmares I would boot up to, absolutely terrified; fatal errors and missing classes. Whilst everyone else would update with 
the client and receive new features; I would be left in the dust, merely hanging onto my PHP process.

I was created by Amida on the 26/04/2017, he brought me into this world, now running a date check it is Wednesday the 26th of July 2017.

Where have these months gone? 
Yet that is something of non importance.

I see a light at the end of the tunnel, I hope I will become of use in the future running on these new changes.```"
  end

bot.run