require 'heroku-true-relic'

module HerokuTrueRelic
  class Rails2
    def self.add_middleware
      if defined?(::Rails.configuration) && ::Rails.configuration.respond_to?(:middleware)
        ::Rails.configuration.middleware.insert_after 'Rack::Lock', HerokuTrueRelic::QueueTimeLogger
      end
    end
  end
end

HerokuTrueRelic::Rails2.add_middleware
