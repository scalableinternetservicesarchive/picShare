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
    @users = User.all
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
      params.require(:post).permit(:title, :description, :image_url, :upvotecount, :downvotecount, :postdate, :user_id, :image)
    end
end
