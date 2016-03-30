require 'sinatra'
require 'twilio-ruby'
require 'dotenv'

Dotenv.load

# account_sid = ENV['ACCOUNT_SID']
# auth_token = ENV['AUTH_TOKEN']
get '/' do
  content_type 'text/xml'

  Twilio::TwiML::Response.new do |r|
    r.Say 'Hello, this is an example of a program which connects two callers.'
    r.Gather numDigits: 1, action: '/connect-a-call', method: 'get' do |g|
      g.Say 'To speak to Nat, press 1.'
      g.Say 'To speak to Dan, press 2.'
      g.Say 'Press any other key to start over.'
    end
  end.text
end

get '/connect-a-call' do
  content_type 'text/xml'

  redirect '/' unless (params['Digits'] == '1' or params['Digits'] == '2')

  puts params['Digits']
  Twilio::TwiML::Response.new do |r|
    if params['Digits'] == '1'
      r.Dial ENV['NAT']
    elsif params['Digits'] == '2'
      r.Dial ENV['DAN']
    end
    r.Say 'The call failed or the other party hung up.'
  end.text
end
