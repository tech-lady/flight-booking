# Fly_App

[![Circle CI](https://circleci.com/gh/andela-oawofadeju/fly-app/tree/develop.svg?style=svg)](https://circleci.com/gh/andela-oawofadeju/fly-app/tree/develop)
[![Coverage Status](https://coveralls.io/repos/github/andela-oawofadeju/fly-app/badge.svg?branch=develop)](https://coveralls.io/github/andela-oawofadeju/fly-app?branch=develop)
[![Code Climate](https://codeclimate.com/github/andela-oawofadeju/fly-app/badges/gpa.svg?maxAge=0)](https://codeclimate.com/github/andela-oawofadeju/fly-app)

## Description

Fly_App is a web application for booking flight reservations. It provides services for passengers to book flights to 
their respective destinations and make payments to that effect.

## Features

This app enebles you to search for already registered flights and book the flight that you want. You can search for flights with date, your origin location and your destination. You can also specify the number of passengers going for this journey, and only the flights that have such number of available seats will be listed out for you. You can also see history of your previously booked flights.

## Dependencies

This project is implemented using the ruby on rails framework and as such in order to effectively run this project locally, you need to have the version 5 or higher of Rails running on your local development machine. You also need to have at least Ruby 2.4.0 installed to have an awesome experience of the app, as rails is written in ruby.


You also need to make sure that you have Rubygems and Bundler installed. RubyGems is a package management framework for Ruby and bundler is a ruby gem that helps to manage other external dependencies in a rails application.

Once you have all the dependencies installed, you can now clone this repo to your local machine. Since you are here, I want to assume you know how to clone a repo.

From your command prompt or terminal, navigate to the app folder and run these commands
```
bundle install
```
or

```
bundle
```

Bundle install or bundle takes care of all other dependencies that are required for this app to run.

Once done, run the following command to prepare the database on your machine.
```
rails db:migrate
```
Then run the following command to preload the database with data.
```
rails db:seed
```
At this point, the app is ready to run. To run the app server, you need to run the rails console which runs on 'localhost:4000'. To start the rails server, run
```
rails s
```
or
```
rails server
```

## Running the tests.

After all the setting up as mentioned above, you can run the tests. The tests are driven by rspec. You can get them fired up by running the following command from the terminal.
```
rspec spec
```
or
```
bundle exec rspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andela-oawofadeju/fly-app. This project is intended to be a safe and welcoming space for collaboration. To contribute to this work:

1. Fork it ( https://github.com/andela-oawofadeju/fly-app/fork )
2. Create your feature branch (`git checkout -b new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin new-feature`)
5. Create a new Pull Request
6. Wait