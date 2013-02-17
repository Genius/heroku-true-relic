heroku-true-relic
=================
Show accurate heroku queue time numbers in new relic

## Disclaimer

This is still a work in progress - please let me know if you're having trouble getting this working!

## Usage

### Rails 3
```ruby
gem 'heroku-true-relic'
```

### Rails 2

```ruby
gem 'heroku-true-relic', :require => 'heroku-true-relic/rails2'
```


### Rack apps (not tested, but should work fine)

```ruby
require 'heroku-true-relic'

...

use HerokuTrueRelic::QueueTimeLogger
```

## Running the specs

* Install [rvm](http://rvm.io)
* Git clone this repository
* cd into the directory (make sure the `.rmvrc` file is read properly
* `rake all:bundle`
* `rake all:spec`
