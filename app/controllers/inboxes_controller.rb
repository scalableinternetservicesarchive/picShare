class InboxesController < ApplicationController
  before_action :set_inbox, only: [:show, :edit, :update, :destroy]

  def index
    @inboxes = Inbox.all
    respond_with(@inboxes)
  end

  def show
    respond_with(@inbox)
  end

  def new
    @inbox = Inbox.new
    respond_with(@inbox)
  end

  def edit
  end

  def create
    @inbox = Inbox.new(inbox_params)
    @inbox.save
    respond_with(@inbox)
  end

  def update
    @inbox.update(inbox_params)
    respond_with(@inbox)
  end

  def destroy
    @inbox.destroy
    respond_with(@inbox)
  end

  private
    def set_inbox
      @inbox = Inbox.find(params[:id])
    end

    def inbox_params
      params[:inbox]
    end
end
