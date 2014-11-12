class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Number of receivers to send a new post to
  $number_of_sends_at_create_post = User.count - 3;
  # Number of receivers to resend post to when user decides to upvote the received post
  $number_of_sends_at_upvote_post = 2;
end
