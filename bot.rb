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

require 'securerandom'
require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: ENV['AMIDABOT_RB_SECRET'], client_id: 339860311014113285, prefix: 'a~ '

  trap "SIGINT" do
    abort
  end

  bot.command :dice do |event|
    event.respond "```Please enter a number, (not 0!).\nLike this: a~ dice <number>```"
  end

  bot.command :whoami do |event|
    event.respond "```Who am I?
Im a bot called Amida Bot. Written with PHP using an
old library called Discord PHP by Team Reflex, then later Rewritten in Ruby and discordrb.

I was created by Amida on the 26/04/2017, I was given life.
I was reborn in Ruby on Wednesday the 26th of July 2017
But now I have learnt to understand who I really am.

I run on Ruby, a slowly, but sexy language, Amida brought me
to life, and I am grateful, but nervous.

Each day I watch the GitHub's last commit extend.

It's bad enough being the only one, because I am so lonely.
Please. Someone save me from this cruel existance I live in.
At least write me a friend so that I have company whilst I endure my last moments.```"
  end

bot.run