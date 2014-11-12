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
    @receivers = pickReceivers(@owner, @post_vote.post_id, 2)
    if @receivers != nil
      @receivers.each do |receiver|
        @post_vote = PostVote.create(user_id: receiver.id, post_id: @post.id, vote: 0)
        @post_vote.save
      end
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
      # Ensure that potential receivers exludes: owner of post and past receivers
      @postVotes = PostVote.where(post_id: post_id)
      @alreadyReceived = @postVotes.map {|postVote| postVote.user_id}
      @alreadyReceived.push(post_owner)

      @num_of_not_received = User.count - (@alreadyReceived.count)

      # If there are enough who receiveres --> send nrOfReceivers users
      if @num_of_not_received >= nrOfReceivers
        potentialReceivers = User.where.not(id: @alreadyReceived)
        @receivers = potentialReceivers.sample(nrOfReceivers)
      end
      # If there are receivers, but not as many as nrOfReceivers --> send to rest of users
      else if @num_of_not_received < nrOfReceivers and @num_of_not_received > 0
        potentialReceivers = User.where.not(id: @alreadyReceived)
        @receivers = potentialReceivers.sample(@num_of_not_received)
      end

      return @receivers
    end
end
