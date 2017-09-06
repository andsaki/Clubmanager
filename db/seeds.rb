# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#5.times do |i|
#  Post.create(title: "title #{i}", body: "body #{i}")
#end

@event = Event.new
@event.title = '中間発表'
@event.about = '17:00~'
@event.year = '2017'
@event.month = '09'
@event.date = '08'
@event.username = 'Appirits'
@event.save

@event = Event.new
@event.title = '最終発表'
@event.about = '17:30~'
@event.year = '2017'
@event.month = '09'
@event.date = '15'
@event.username = 'Appirits'
@event.save