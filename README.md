# health_graph

Ruby gem to work with RunKeeper Health Graph API.  More information about RunKeeper Health Graph API http://developer.runkeeper.com/healthgraph.

## Usage

### Authentication

```ruby
HealthGraph.configure do |config|
  config.client_id = [YOUR HEALTH GRAPH CLIENT ID]
  config.client_secret = [YOUR HEALTH GRAPH CLIENT SECRET]
  config.authorization_redirect_url = [PAGE TO REDIRECT THE USER TO AFTER AUTH]
end

auth_url = HealthGraph.authorize_url

access_token = HealthGraph.access_token(auth_code)
```

For more information on authentication & authorization, see http://developer.runkeeper.com/healthgraph/registration-authorization 

### Accessing Health Graph API

```ruby
user = HealthGraph::User.new(access_token)
profile = user.profile
fitness_activities = user.fitness_activities.items
sleep = user.sleep.items
weight = user.weight.items
```
### Other Configuration options

```ruby
HealthGraph.configure do |config|
  config.client_id = [YOUR HEALTH GRAPH CLIENT ID. REQUIRED.]
  config.client_secret = [YOUR HEALTH GRAPH CLIENT SECRET. REQUIRED.]
  config.authorization_redirect_url = [PAGE TO REDIRECT THE USER TO AFTER AUTH. REQUIRED.]
  config.authorization_url = [URL TO AUTHORIZE USER. DEFAULT IS http://runkeeper.com/apps/authorize]
  config.access_token_url = [URL TO GET USER ACCESS TOKEN. DEFAULT IS http://runkeeper.com/apps/token]  
  config.endpoint = [API ENDPOINT. DEFAULT IS http://api.runkeeper.com]
  config.adapter = [FARADAY ADAPTER. DEFAULT IS net_http]
  config.faraday_options = [ADDITIONAL FARADAY OPTIONS. DEFAULT IS EMPTY.]
end
```

## Contributing to health_graph
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Kenny Ma. See LICENSE.txt for
further details.

