# Call scheduler

This is an example program that connects people over the phone.

This app uses Twilio’s Ruby gem to generate TwiML. It runs on Sinatra, and is _not_ backed by a database.

## Installation

Clone the repository, and install the required gems:

```
$ bundle
```

You will need to set up `.env` file as shown in `.env.example`.

And you’re done! Currently the app does not use a database, so there are no more installation steps.

## Running in development

In development, you can run the app like this:

```
$ bundle exec ruby respond.rb
```

Running it locally isn’t particularly useful unless you can set up port forwarding. The app relies on Twillo, which needs a public URL to access the call script.

## Deploying to Heroku

Assuming you were given Heroku acces, you should be able to `git push heroku master`.
