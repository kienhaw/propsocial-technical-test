# README

Getting Started
Install Rails at the command prompt if you haven't yet:

$ gem install rails

At the command prompt, git clone the repo:

$ git clone

Change directory to cloned repo and start the web server and run bundle install:

 $ cd cloned_app

 $ bundle install

 $ rails server
 
Run with --help or -h for options.

Go to http://localhost:3000 and you'll see login page

List all your suggestions about how we can be improve the web app that is not mentioned above:
1. It's advisable to use gem 'doorkeeper' and 'devise' for better security and minimal effort to setup.

- Devise handles confirmation emails (confirmable) and password reset (recoverable) system for you so use their system, it is just options to activate
- Doorkeeper is an implementation of a combined solution ’authentication/resource server’.
- Rails API with a nice User management via devise gem, with both frontend forms and JSON access, and with a token-based OAuth authentication via doorkeeper.

2. It is also advisable to use active storage as image upload

- Active Storage makes it simple to upload and reference files in cloud services like Amazon S3, Google Cloud Storage, or Microsoft Azure Storage, and attach those files to Active Records.
- It is a built in function without extra dependencies
- No need for migrations, ActiveStorage by default provides all that is required to store file information
