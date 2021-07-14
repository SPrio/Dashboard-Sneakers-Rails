class RecentPosts
  KEY = "recent_posts" # Redis Key
  STORE_LIMIT = 5 #How many post should be kept

  # get list of recent posts from redis
  # we need to parse each list item as JSON
  def self.list(limit = STORE_LIMIT)
    $redis.lrange(KEY, 0, limit-1).map do |raw_post|
      JSON.parse(raw_post).with_indifferent_access
    end
  end

  # Push new posts to the list and trim its size
  def self.push(raw_post)
    $redis.lpush(KEY, raw_post)
    $redis.ltrim(KEY, 0, STORE_LIMIT-1)
  end
end
