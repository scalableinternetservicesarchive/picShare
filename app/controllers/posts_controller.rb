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
    @receivers = pickReceivers(@post.user_id, $number_of_sends_at_create_post)
    @receivers.each do |receiver|  
      @post_vote = PostVote.create(user_id: receiver.id, post_id: @post.id, vote: 0)
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

    def pickReceivers(post_owner, nrOfReceivers)
      # Ensure that potential receivers exludes owner of post
      potentialReceivers = User.where.not(id: post_owner)
      if potentialReceivers.count >= nrOfReceivers
        @receivers = potentialReceivers.sample(nrOfReceivers)
      end
    else if potentialReceivers.count < nrOfReceivers and potentialReceivers > 0
      @receivers = potentialReceivers.sample(potentialReceivers.count)
    end

      return @receivers
    end
end
