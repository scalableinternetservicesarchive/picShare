class PostVotesController < ApplicationController
  before_action :set_post_vote, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
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
      
      @receivers = pickReceivers(@owner, @post_vote.post_id, $number_of_sends_at_upvote_post)
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

  def upvote
    @post_vote.update_attribute(:vote, 1)
    redirect_to home_inbox_path
  end
  helper_method :upvote

  def downvote
    @post_vote.update_attribute(:vote, -1)
    redirect_to home_inbox_path
  end
  helper_method :downvote

  private
    def set_post_vote
      @post_vote = PostVote.find(params[:id])
    end

    def post_vote_params
      #params[:post_vote]
      params.require(:post_vote).permit(:user_id, :post_id, :vote)
    end

    def pickReceivers(post_owner, post_id, nrOfReceivers)
       # Ensure that potential receivers exludes: owner of post and past receivers
      @postVotes = PostVote.where(post_id: post_id)
      @alreadyReceived = @postVotes.map {|postVote| postVote.user_id}
      @alreadyReceived.push(post_owner)

      @num_of_not_received = User.count - (@alreadyReceived.count)

      # If there are enough who receiveres --> send nrOfReceivers users
      potentialReceivers = User.where.not(id: @alreadyReceived)
      if @num_of_not_received >= nrOfReceivers
        @receivers = potentialReceivers.sample(nrOfReceivers)
      # If there are receivers, but not as many as nrOfReceivers --> send to rest of users
      elsif @num_of_not_received < nrOfReceivers and @num_of_not_received > 0
        @receivers = potentialReceivers.sample(@num_of_not_received)
      else
        @receivers = nil;
      end


      return @receivers
    end
end
