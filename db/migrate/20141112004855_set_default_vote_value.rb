class SetDefaultVoteValue < ActiveRecord::Migration
  def change
  	change_column :posts, :upvotecount, :integer, :default => 0
  	change_column :posts, :downvotecount, :integer, :default => 0
  	change_column :post_votes, :vote, :integer, :default => 0
  end
end
