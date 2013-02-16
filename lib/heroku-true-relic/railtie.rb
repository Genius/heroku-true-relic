module HerokuTrueRelic
  class Railtie < Rails::Railtie
    initializer 'heroku_true_relic.add_queue_time_logger' do |app|
      app.config.middleware.insert_after 'Rack::Lock', "HerokuTrueRelic::QueueTimeLogger"
    end
  end
end
