class HomeController < ApplicationController
  def index
    @posts = RecentPosts.list
    render json: @posts
  end
end
