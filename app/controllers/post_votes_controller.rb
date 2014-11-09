class PostVotesController < ApplicationController
  before_action :set_post_vote, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml

  def index
    @post_votes = PostVote.all
    respond_with(@post_votes)
  end

  def show
    respond_with(@post_vote)
  end

  def new
    @post_vote = PostVote.new
    respond_with(@post_vote)
  end

  def edit
  end

  def create
    @post_vote = PostVote.new(post_vote_params)
    @post_vote.save
    respond_with(@post_vote)
  end

  def update
    @post_vote.update(post_vote_params)
    @post = @post_vote.post
    @owner = @post.user_id
    if @post_vote.vote == 1
      @post.update(upvotecount: @post.upvotecount + 1) 
      
      @receivers = pickNewReceivers(@owner, @post_vote.post_id, 2)
        if @receivers != nil
          @receivers.each do |receiver|
            @post_vote = PostVote.create(user_id: receiver.id, post_id: @post.id, vote: 0)
            @post_vote.save
        end
      end
    else
      @post.update(downvotecount: @post.downvotecount+1)
    end

    respond_with(@post_vote)

  end

  def destroy
    @post_vote.destroy
    respond_with(@post_vote)
  end

  private
    def set_post_vote
      @post_vote = PostVote.find(params[:id])
    end

    def post_vote_params
      #params[:post_vote]
      params.require(:post_vote).permit(:user_id, :post_id, :vote)
    end

    def pickNewReceivers(post_owner, post_id, nrOfReceivers)
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
