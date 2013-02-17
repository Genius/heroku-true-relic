module HerokuTrueRelic
  # combination of https://gist.github.com/daveyeu/4960893
  # and https://gist.github.com/jasonrclark/d82a1ea7695daac0b9ee
  class QueueTimeLogger
    attr_reader :app

    def initialize(app, options = {})
      @app = app
    end

    def call(env)
      now = Time.now.to_f

      # Delete Heroku's queue time header because it's incorrect and useless
      env.delete("HTTP_X_HEROKU_QUEUE_WAIT_TIME")

      microseconds = (now * 1_000_000).to_i
      env["HTTP_X_MIDDLEWARE_START"] = "t=#{microseconds}"

      if env["HTTP_X_REQUEST_START"]
        # HTTP_X_REQUEST_START is expected by New Relic to have a t= leading
        # but currently doesn't, so it can just get to_i applied.
        request_start_microseconds = env["HTTP_X_REQUEST_START"].to_i * 1_000
        queue_time_microseconds = [microseconds - request_start_microseconds, 0].max

        env["HTTP_X_QUEUE_TIME"] = "t=#{queue_time_microseconds}"
      end

      app.call(env)
    end
  end
end
