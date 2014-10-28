class Post < ActiveRecord::Base
	belongs_to :user
	has_many :postVotes
	has_many :users, through :postVotes
end

class postVotes < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
end