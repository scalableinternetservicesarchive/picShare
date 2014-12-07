# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([
	{ email: 'testA@mail.com', password: '12345678', password_confirmation: '12345678'},
	{ email: 'testB@mail.com', password: '23456789', password_confirmation: '23456789'},
	{ email: 'testC@mail.com', password: '34567890', password_confirmation: '34567890'},
	{ email: 'testD@mail.com', password: '12345678', password_confirmation: '12345678'},
	{ email: 'testE@mail.com', password: '12345678', password_confirmation: '12345678'}])


(0..5).each do |i|
	p = Post.create([user_id: i, title:"Title!", description: "Desc_C3", image: File.open('http://placehold.it/640x640&text=Test%20Image'), postdate: Time.now)
	p.save!
end 
