class AddVoteToPostVote < ActiveRecord::Migration
  def change
  	 add_column :postVotes, :vote, :integer
  end
end
