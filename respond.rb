require 'sinatra'
require 'twilio-ruby'
require 'dotenv'

Dotenv.load

# account_sid = ENV['ACCOUNT_SID']
# auth_token = ENV['AUTH_TOKEN']

get '/' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Hello, calling someone'
    r.Gather finishOnKey: '*' do |g|
      r.Dial callerId: ENV['NAT']
    end
  end.text
end

