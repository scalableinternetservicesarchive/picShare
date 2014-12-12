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
    @params = post_params
    @params[:postdate] = Time.now
    @post = current_user.posts.build(@params)
    if @post.save then
      puts 'creating post votes'
      @receivers = pickReceivers(@post.user_id, $number_of_sends_at_create_post)
      @receivers.each do |receiver|  
        if receiver["id"] == @post.user_id
          next
        end
        @post_vote = PostVote.create(user_id: receiver["id"], post_id: @post.id, vote: 0)
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
      params.require(:post).permit(:title, :description, :image, :upvotecount, :downvotecount, :postdate, :user_id)
    end

    def pickReceivers(post_owner, nrOfReceivers)
      #potentialReceivers = User.where.not(id: post_owner)
      sql = "SELECT id FROM users ORDER BY RAND() LIMIT "+nrOfReceivers.to_s
      receivers = ActiveRecord::Base.connection.execute(sql)
      return receivers
    end
end
