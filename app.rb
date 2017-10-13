require 'sinatra'

if development?
  require 'sinatra/reloader'
  require 'pry'
  require 'json'
end

# =====================
# Helpers

# Return res msg that is visible to the channel
def get_text(msg)
  {
    response_type: 'in_channel',
    text: msg
  }.to_json
end

response_answers = {
  edu: get_text('He attends University of British Columbia studying Combined Major in Business and Computer Science :pencil:'),
  exp: get_text(['Past work :computer:',
                 'Web Develper @ Ubyssey.ca (Oct 2017 ~ Present)',
                 'Student Developer Intern @ BlackBerry.com (Jan 2017 - Aug 2017)',
                 'Software Engineering Intern @ Prynt.co (Jul 2016 - Dec 2016)',
                 '',
                 'Past talks :speaking_head_in_silhouette::',
                 'StartupStorm workshops',
                 'DevTeach Montreal',
                 'OttawaJS'].join("\n")),
  joke: get_text('What did wasabi A said to wasabi B? "Wassup-B!"'),
  ping: get_text('test'),
  origin: get_text("I'm originally from Kyoto, Japan. Grew 6 years in U.S, and now studies in Vancouver, Canada :flag-ca:"),
  contact: get_text("I'm available by yamaatsushi927@gmail.com or @jumbosushi on Twitter :thumbsup:"),
  # Help command lambda returns all the keys in this object
  help: -> { get_text("Here are the available commands:\n #{response_answers.keys.map(&:to_s)}") },
}

# =====================
# Route

before do
  content_type 'application/json'
end

get '/' do
  'This is api for atsushi-bot. Try adding it a slack slash command!'
end

post '/' do
  text = params.fetch('text').strip
  answer = response_answers[text.to_sym]
  if text == 'help'
    response_answers[:help].call
  elsif answer
    answer
  else
    get_text("Hmm I don't recognize that command :thinking_face: Try help command to list of commands")
  end
end
