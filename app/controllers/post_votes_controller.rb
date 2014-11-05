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
end
