class HomeController < ApplicationController
  def inbox
  	@post_votes = PostVote.includes(:post).where(user: current_user).where(vote: 0)
  end

  def new
  	redirect_to '/posts/new'
  end

  def myposts
  	@posts = Post.includes(:image, :title, :postdate, :upvotecount, :downvotecount).where(user_id: current_user)
  end

  def topposts
    @posts = Post.includes(:image, :title, :postdate, :upvotecount, :downvotecount).order('upvoteCount - downvoteCount DESC').limit(10)
  end

  def index
  end
end
