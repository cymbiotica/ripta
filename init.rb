require 'dotenv'
Dotenv.load

GTFS::Realtime.configure do |config|
  config.static_feed = "http://www.ripta.com/googledata/current/google_transit.zip"
  config.trip_updates_feed = "http://realtime.ripta.com:81/api/tripupdates"
  config.vehicle_positions_feed = "http://realtime.ripta.com:81/api/vehiclepositions"
  config.service_alerts_feed = "http://realtime.ripta.com:81/api/servicealerts"
  config.database_url = ENV["DATABASE_URL"]
end

Rollbar.configure do |config|
  config.access_token = ENV['ROLLBAR_ACCESS_TOKEN']
  config.exception_level_filters.merge!({
    'ActiveRecord::RecordNotFound' => 'ignore',
    'Sinatra::NotFound' => 'ignore'
  })
end

Time.zone = "America/New_York"
