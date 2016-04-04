# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
['translator'].each do |name|
  Role.create(name: name)
end

['translator', 'user0'].each do |login|
  User.create(login: login)
end

u = User.find_by(login: 'translator')
r = Role.find_by(name: 'translator')
u.roles << r
