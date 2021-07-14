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
    event = ch.default_exchange

    # get or create queue
    queue = ch.queue("test_rabbitmq", :durable => true)

    # bind queue to exchange
    # queue.bind(event)

    conn.close
  end
end

Rails.application.load_tasks
