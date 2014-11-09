class HomeController < ApplicationController
  def inbox
  	@post_votes = PostVote.where(user: current_user).where(vote: 0)
  end

  def new
  	redirect_to '/posts/new'
  end

  def myposts
  end

  def index
  end
end
