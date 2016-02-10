# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# puts "hello world"
# create_account = User.create([email: "rrrjjjqqq@gmail.com", password: '12345678', password_confirmation: '12345678', name: "測試用"])
user = User.new()
user.email = "rrrjjjqqq@gmail.com"
user.password = '12345678'
user.password_confirmation = '12345678'
user.name = "測試用"
user.save

create_groups = 1.upto(20) do |i|
  # Group.create([title: "Group no. #{i}", description: "#{i} group by seed", user_id: 1])
  group = Group.new()
  group.title = "Group no. #{i}"
  group.description = "#{i} group by seed"
  group.user_id = 1
  group.save

  # user建立即為group成員
  user.join!(group)

  1.upto(30) do |k|
    Post.create([group_id: "#{i}", content: "#{k} message by seed", user_id: 1])
  end
end