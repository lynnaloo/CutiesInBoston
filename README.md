Cuties In Hampton Roads
==============

Project of [Becky Boone](https://github.com/boonrs) and [Drew](https://github.com/drewrwilson) during their fellowship at Code for America in 2014.

Modified by [CodeforBoston](codeforboston.com) to work with the Petfinder.com API

Modified by [CodeforHamptonRoads](http://codeforhamptonroads.org/) to move the shelter_id to an environment variable
so one repository can be used for several cities. Also added #hashtags for breed, type, and city.

## About
A twitter bot that pulls data from the Petfinder API and tweets out adoptable pets from the
the shelter of your choosing to a twitter feed.

This is easily extendable to other shelters using [petfinder.com](petfinder.com) to list their animals.

This Github Repository supports this Twitter account:

* [Twitter bot](http://twitter.com/CutiesInNorfolk)

Petfinder API Docs:

* [API Docs`](https://www.petfinder.com/developers/api-docs)

## Setup

### Install dependencies (other gems, aka Ruby libraries)

  `bundle install`

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

Copy `template.env` and rename as `.env` file to include your actual keys instead of placeholders.
The variables in this file will be automatically picked up when you run the rake task. If you would like to
specify multiple shelters to select random pets from, identify them as a comma-separated list.

Do not commit your modified .env file to anywhere public. The .env line in the .gitignore file prevents you
from accidentally exposing your keys. Do not remove this line.

    consumer_key=XXXXXXXXXXXXXXXXXXXXXX
    consumer_secret=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    access_token=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    access_token_secret=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    petfinder_key=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    petfinder_secret=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    shelter_id=MA124

### How to Tweet

    rake tweet

The tweet task is in the Rakefile, which invokes the rest of `cuties.rb`.

#### Alternatives

CutiesInNorfolk and CutiesInPtown uses Heroku and the Heroku Scheduler plugin to tweet hourly.

You can use this Github repository for several Twitter account as long as you set
the environment variables on the Heroku instances.

-----------------------

**Hat tips**

* Kudos to [Darius](https://github.com/dariusk) for his [great guide](http://tinysubversions.com/2013/09/how-to-make-a-twitter-bot/) on how to make a twitter bot.

* And kudo to [Erik](https://github.com/sferik/) for the [twitter gem](https://github.com/sferik/twitter).
