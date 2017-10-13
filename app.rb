require 'sinatra'

get '/' do
  'Hello world!'
end

post '/' do
  text = params.fetch('text').strip

  case text
  when 'ls'
    'Work:
    Web Develper @ Ubysser (Oct 2017 ~ Present)
    Student Developer Intern @ BlackBerry (Jan 2017 - Aug 2017)
    Software Engineering Intern @ Prynt (Jul 2016 - Dec 2016)

    Speaking:
    StartupStorm workshops
    DevTeach Montreal
    OttawaJS

    School:
    University of British Columbia'
  when 'jokes'
    "Why did chicken cross the road?"
  when 'ping'
    "Hi!"
  when 'origin'
    "I'm originally from Kyoto, Japan. Grew 6 years in U.S, and now studies in Vancouver, Canada :flag-ca:"
  end
end
