class HomeController < ApplicationController
  def index
    @users = User.all
    @recent_posts = Post.limit(1).order("created_at DESC")
  end
end
