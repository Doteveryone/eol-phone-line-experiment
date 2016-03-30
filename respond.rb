require 'sinatra'
require 'twilio-ruby'
require 'dotenv'

Dotenv.load

# account_sid = ENV['ACCOUNT_SID']
# auth_token = ENV['AUTH_TOKEN']

get '/' do
  content_type 'text/xml'
  Twilio::TwiML::Response.new do |r|
    r.Say 'Hello, calling someone'
    r.Dial callerId: ENV['NAT']
  end.text
end

