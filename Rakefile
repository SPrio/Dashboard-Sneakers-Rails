# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"
require "sneakers/tasks"

namespace :rabbitmq do
  desc "Setup routing"
  task :setup do
    require "bunny"

    conn = Bunny.new
    conn.start

    ch = conn.create_channel

    # get or create exchange
    event = ch.direct('test_exchange')

    # get or create queue
    queue = ch.queue("test_queue", :durable => true)

    # bind queue to exchange
    queue.bind(event, routing_key: "test_queue")

    conn.close
  end
end

Rails.application.load_tasks
