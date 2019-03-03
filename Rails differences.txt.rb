Rails 6 requires Ruby 2.4.1+
Rails 5 requires Ruby 2.2.2+ (Ruby 2.2.1+ symbols are garbage collected as well.)
Rails 4 prefers Ruby 2.0 and requires 1.9.3+

"Tubolinks 3 allows you to retain most of your page and selectively update certain regions through partials instead of refreshing entire page. Just like React, which handles this very well with the Virtual DOM."

"ActiveRecord" is a wrapper for Database. You can write code for it and then it decides how to execute it, depending which backend you're using.

"ActiveJob" is just another wrapper. In this case DelayedJob would be the backend that actually runs jobs. If down the road you decide to switch to something like Resque or Sidekiq, all your code should still work because translation is handled by ActiveJob wrapper

"ActiveStorage" to upload files to service.
  https://medium.com/alturasoluciones/setting-up-rails-5-active-storage-with-amazon-s3-3d158cf021ff
  STEPS:
  * Creating the Amazon’s S3 Bucket.
  * Add user policy to grant access to files.
  * Setup environment variables on Heroku.
  * Config storage.yml.
  * Config environments production.rb or staging.rb.
  * Use Active Storage to store files on Amazon’s S3 Bucket.


Rails 5:
* Richard Schneeman commit to make performance improvements 11%,
* use rails instead of rake
* restart Rails server: rails/rake restart
* API only application
  Que: Why API app instead of complete Rails App?
  Ans: When you don’t need entire Rails middleware stack. Basically you don’t need ActionController::Base, Asset Pipeline, Views, Helpers etc. - then you should use Rails API app.
    rails new my_rails_api_app --api
  For existing app
    config/application.rb => config.api_only = true
    In class ApplicationController < ActionController::Base change '::Base' to '::API'
* ActionCable is Framework for Real-Time communication over WebSockets. 
    with 'redis' adapter for production
    cable: a way to communicate between browser(client) & server
    channels > action_cable > 
      channel.rb   < ActionCable::Channel::Base (a Cable can have multiple channels)
      connection.rb   < ActionCable::Connection::Base (created using WebSockets)
    Broadcast: server can broadcast data to different channels
* In ActiveRecord::Base where.not & where.or are introduced
* In ActionMailer: 'deliver_now' & 'deliver_later' instead of 'deliver'
* belongs_to :author, optional: true  =>  doesn't generate error when associations are not present.
  default  =>   config.active_record.belongs_to_required_by_default = true

Rails 5.2:
* ActiveJob
* ActiveStorage
* freez_time instead ==> travel_to Time.current 
    Time.current # => Sun, 09 Jul 2017 15:34:49 EST -05:00
    freeze_time
    sleep(1)
    Time.current # => Sun, 09 Jul 2017 15:34:49 EST -05:00
* Recyleable Cache Keys
    On updating a record Rails compares the cache_version of your record with the version stored in the ActiveSupport::Cache::Entry object. 
    If they don’t match, Rails acts as though it encountered a cache miss and it over-writes the existing cache key instead of creating a new one and leaving the old one. 
    And so this should result in lower cache memory use?
    config.active_record.cache_versioning = true
    i.e. store last 5 updates of a record
          post.cache_key & post.cache_verion
* AEAD encrypted cookies
    fast encryption/decryption & shorter cyphertext
    set cookie encryption to 'true' in config
* Built in redis cache store
    config.cache_store = :redis_cache_store
* Bootsnap default in Gemfile (to optimize and cache expensive computations.)
* Person.pick(:name).first
tmp cache

Rails 6.0.0:
* Action Mailbox
* Action Text
* Parallel Testing
* Action Cable Testing
