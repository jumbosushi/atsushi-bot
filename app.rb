#!/usr/bin/ruby
require 'sinatra'

get '/' do
  'This is api for atsushi-bot. Try adding it as an endpoint for slack slash command!'
end

def get_text(msg)
    JSON.generate({
      text: msg
    })
end

post '/' do
  text = params.fetch('text').strip

  case text
  when 'ls'
    get_text('Work:
    Web Develper @ Ubysser (Oct 2017 ~ Present)
    Student Developer Intern @ BlackBerry (Jan 2017 - Aug 2017)
    Software Engineering Intern @ Prynt (Jul 2016 - Dec 2016)

    Speaking:
    StartupStorm workshops
    DevTeach Montreal
    OttawaJS

    School:
    University of British Columbia')
  when 'jokes'
    get_text("Why did chicken cross the road?")
  when 'ping'
    get_text("Hi!")
  when 'origin'
    get_text("I'm originally from Kyoto, Japan. Grew 6 years in U.S, and now studies in Vancouver, Canada :flag-ca:")
  end
end
