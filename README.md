# About Juvia

![Logo](https://github.com/FooBarWidget/juvia/raw/master/app/assets/images/logo-128.png)

Juvia is an open source commenting system. It allows you to outsource your commenting needs to an external system so that you don't have to build your own commenting system for each website or each web app. Embedding a Juvia commenting page only involves pasting a JavaScript snippet into your web page.

Juvia is similar to [Disqus](http://www.disqus.com/) and [IntenseDebate](http://intensedebate.com/). However both of them seem to be designed in the early 2000s before the rise of AJAX: trying to integrate either of them in an AJAX web application results in many wasted afternoons and a screen full of inexplicable JavaScript errors. Juvia offers full support for AJAX web pages and any JavaScript is written in such a way that it avoids conflicts with the page's existing JavaScripts.

Juvia currently also makes no effort to support nested comments. I believe nested comments only make sense for extremely active discussion forums. Instead, Juvia strives for simplicity.

Other notable highlights:

 * Moderation support, either manually or automatically via [Akismet](http://akismet.com/).
 * Multi-user support. With this I don't mean commenters but users who operate the Juvia admin panel. Each user account is isolated and can only see and manage its own sites, topics and comments, except for administrators who can see and manage everything.
 * Email notification of new comments.

## Demo

You can see Juvia in action at (the demo site)[http://juvia-demo.phusion.nl]. Post comments at (http://juvia-demo.phusion.nl/admin/sites/1/test)[this test comments page]. The demo site is reset every 24 hours.

## Installation

1. Clone this repository into a desired directory and `cd` to it.
2. Configure your database details by editing config/database.yml. An example is provided in config/database.yml.example. Only edit the information under the 'production' section.
3. Configure other things by editing config/application.yml. An example is provided in config/application.yml.example. Only edit the information under the 'production' section.
4. Install the necessary dependencies: `bundle install --without='development test' --path=help`
5. Install the database schema: `bundle exec rake db:schema:load RAILS_ENV=production`
6. Compile the static assets: `bundle exec rake assets:precompile RAILS_ENV=production RAILS_GROUPS=assets`
7. Deploy this application to Phusion Passenger or whatever application server you prefer.

You can now access Juvia through the address that you configured. It will ask you to create an initial administrator account and to register a site.

## Upgrade

1. `cd` to the source directory and update the code to the latest version: `git fetch && git reset --hard origin/master`
2. Install the necessary dependencies: `bundle install --without='development test' --path=help`
3. Upgrade the database schema: `bundle exec rake db:migrate RAILS_ENV=production`
4. Compile the static assets: `bundle exec rake assets:precompile RAILS_ENV=production RAILS_GROUPS=assets`
5. Run `touch tmp/restart.txt` (if you're using Phusion Passenger) or restart your application server.
