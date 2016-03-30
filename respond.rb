require 'sinatra'
require 'twilio-ruby'
require 'dotenv'

Dotenv.load

# account_sid = ENV['ACCOUNT_SID']
# auth_token = ENV['AUTH_TOKEN']

get '/' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Hello, calling Dan'
    r.Gather finishOnKey: '*' do |g|
      r.Dial callerId: ENV['DAN']
    end
  end.text
end

