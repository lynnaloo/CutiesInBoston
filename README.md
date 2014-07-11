[![Build Status](https://travis-ci.org/stanzheng/CutiesInNorfolk.svg)](https://travis-ci.org/stanzheng/CutiesInNorfolk)

Cuties In Norfolk
==============

Project of [Becky Boone](https://github.com/boonrs) and [Drew](https://github.com/drewrwilson) during their fellowship at Code for America in 2014.

Modified by [CodeforBoston](codeforboston.com) to work with the Petfinder.com API

Modifyed by [CodeforHamptonRoads](http://codeforhamptonroads.org/) to work with Norfolk area shelters.

## About
A twitter bot that pulls data from the Petfinder API and tweets out adoptable pets from the
[Norfolk Animal Care Center](http://www.norfolk.gov/Index.aspx?NID=260) to a twitter feed.

It should be easily extendable to other shelters using [petfinder.com](petfinder.com) to list their animals.

**Links to API and Bot**

* [Twitter bot](http://twitter.com/CutiesInNorfolk)

* [API Docs`](https://www.petfinder.com/developers/api-docs)

## Setup

### Install dependencies (other gems, aka Ruby libraries)

    bundle install

### Get your API keys

You need to sign up for a twitter API. You'll need all of the following:

* consumer_key
* consumer_secret
* access_token
* access_token_secret
* shelter_id of the shelter you want to query

To get twitter keys setup an application for your twitter account: https://dev.twitter.com/docs/auth/tokens-devtwittercom

You'll also need Petfinder keys

* petfinder_key
* petfinder_secret

To get them, first register for a Petfinder account: https://users.petfinder.com/login

Then sign up for the API keys: https://www.petfinder.com/developers/api-key


### Set up your environment variables

Rename the sample.env to .env and edit to include your actual keys instead of placeholders. The variables in this file will be automatically picked up when you run the rake task.

Do not commit your modified .env file to anywhere public. The .env line in the .gitignore file prevents you from accidentially exposing your keys. Do not remove this line.

    consumer_key=XXXXXXXXXXXXXXXXXXXXXX
    consumer_secret=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    access_token=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    access_token_secret=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    petfinder_key=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    petfinder_secret=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

### How to Tweet

    rake tweet

The tweet task is in the Rakefile, which invokes the rest of `cuties.rb`.

### How to Tweet Periodically

Install the application on a server or a computer that will be powered on continuously.

    cd <install_path>
    git clone git@github.com:codeforboston/CutiesInNorfolk.git
    cd CutiesInNorfolk
    bundle install
    crontab -e  # opens an editor to add a line to your scheduled cron jobs

Add the following to your crontab

    00 08,16 * * * cd <install_path>/CutiesInNorfolk && /usr/local/bin/rake tweet

This tweets at 8:00am and 4:00pm (0800 hours and 1600 hours) every day.
You can learn how to configure the crontab to your preference [here](https://help.ubuntu.com/community/CronHowto).

#### Alternatives

CutiesInNorfolk uses Heroku and the Heroku Scheduler plugin to tweet at regular intervals.

-----------------------

**Hat tips**

* Kudos to [Darius](https://github.com/dariusk) for his [great guide](http://tinysubversions.com/2013/09/how-to-make-a-twitter-bot/) on how to make a twitter bot.

* And kudo to [Erik](https://github.com/sferik/) for the [twitter gem](https://github.com/sferik/twitter).
