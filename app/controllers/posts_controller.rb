class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    #@post = Post.new(post_params)
    #@post.user = current_user
    @post = current_user.posts.build(post_params)
    @post.save
    @users = pickReceivers(@post.user_id, @post.id, User.count - 1)
    @users.each do |user|  
      @post_vote = PostVote.create(user_id: user.id, post_id: @post.id, vote: 0)
      @post_vote.save
    end
    respond_with(@post)
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :image_url, :upvotecount, :downvotecount, :postdate, :user_id)
    end

    def pickReceivers(post_owner, post_id, nrOfReceivers)
      @postVotes = PostVote.where(post_id: post_id)
      @alreadyReceived = @postVotes.map {|postVote| postVote.user_id}

      # Ensure that potential receivers exludes: owner of post and past receivers
      potentialReceivers = User.where.not("id = ? and id = ?", @alreadyReceived, post_owner)
    
      @receivers = potentialReceivers.sample(nrOfReceivers)
      return @receivers
    end
end
