class PostsWorker
  include Sneakers::Worker

  # this worker will connect to "dashboard.posts" queue
  # env is set to nil since by default the actual name would be dashboard.posts_development
  from_queue "test_rabbitmq", env: nil

  def work(raw_post)
    RecentPosts.push(raw_post)
    ack!
  end
end
