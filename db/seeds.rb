# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
userCount = 10
postPrUserCount = 5
postVotesPrPostCount = 3

pic =File.open('/home/ec2-user/app/kitty.jpg')

(1..userCount).each do |i| 
	user = User.create(email: i.to_s+'@mail.com', password: '12345678', password_confirmation: '12345678')
	(1..postPrUserCount).each do |j|
		p = Post.create(user_id: i, title:"Title!", description: "Desc_C3", image: pic, postdate: Time.now)
			(1..postVotesPrPostCount).each do |k|
				postVote = PostVote.create(user_id: (i+k)%userCount, post_id: p.id)
		end
	end
end

=begin
	
(1..5).each do |i|
	p = Post.create([{user_id: i, title:"Title!", description: "Desc_C3", image: File.open('C:\Users\Vikas\kitty.jpg'), postdate: Time.now}])
end 

=end

#(1..5).each do 

