class HomeController < ApplicationController
  def inbox
  	@post_votes = PostVote.where(user: current_user).where(vote: 0)
  end

  def new
  	redirect_to '/posts/new'
  end

  def myposts
  	@posts = Post.where(user_id: current_user)
  end

  def topposts
    @posts = Post.order('upvoteCount - downvoteCount DESC').limit(10)
  end

  def index
  end
end
