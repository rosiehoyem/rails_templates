# App Name

## Contents

* [Description](#description)
* [Overview](#overview)
* [Dependencies](#dependencies)
* [Compatibility](#compatibility)
* [Development Setup](#development-setup)
* [Production Setup](#production-setup)
* [Deployment](#deployment)

## Descritption

Description of all of the cool stuff this app does.


## Overview

The app is hosted on Heroku.

* `app_name` is the production instance of this app.

There currently is no staging instance.

### Branches

* `master` is used for local development.
* `stable` reflects a stable, tested version of the app. This branch is deployed to Heroku.


## Dependencies

* [See the Gemfile](https://github.com/rosiehoyem/app_name/blob/master/Gemfile)
* Ruby 2.3.1
* Rails 5
* PostgreSQL


## Compatibility

### Supported Browsers

I make a reasonable effort to minimally support all modern web browsers. This site is optimized for Google Chrome.


## Development Setup

### Configure and install the dependencies

* Install gems with `bundle install`

### Grab the Source

1. Clone the repo:

        $ git clone git@github.com:rosiehoyem/app_name.git
        $ cd app_name
        $ git checkout -t origin/stable
        $ git checkout master

2. Install the Heroku Toolbelt: https://toolbelt.heroku.com/

3. Add Heroku remote:

        $ git remote add staging git@heroku.com:life_stream_server.git


### App Setup

1. Install dependencies:

        $ bundle install

2. Initialize the db and seed it:

        $ rake db:create
        $ rake db:migrate
        $ rake db:seed

3. Run unit tests:

        $ bundle exec rake spec

4. Start the server:

        $ bundle exec rails server


## Dependencies

List of dependencies.