class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Number of receivers to send a new post to
  $number_of_sends_at_create_post = 10;
  # Number of receivers to resend post to when user decides to upvote the received post
  $number_of_sends_at_upvote_post = 10;

  #This is a check for the systemcalls in Gemfile, which will make sure that the system calls runs only once
  $installsystemcall = true

  # Redirect to Inbox after successful sign_in
  def after_sign_in_path_for(resource_or_scope)
  	home_inbox_path
  end

end
