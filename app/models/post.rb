class Post < ActiveRecord::Base
	belongs_to :user
	has_many :post_votes
	has_many :users, through: :post_votes
	
	has_attached_file :image,
		:styles => { :original => "640x640>", :thumb => "100x100>" }, 
		#:storage => :s3,
		#:s3_credentials => "#{Rails.root}/config/aws.yml",
		#:path => "picShare/:class/:attachment/:id/:style/:filename",
		#:bucket => "cs290"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/ 
	
	validates :title, :image, :description, :upvotecount, :downvotecount, :postdate, presence: true
	validates :upvotecount, :downvotecount, numericality: {greater_than_or_equal_to: 0}

end
