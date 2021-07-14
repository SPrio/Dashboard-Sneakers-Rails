$redis = Redis::Namespace.new("dashboard:#{RAILS.env}", redis: Redis.new)
