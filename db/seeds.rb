# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
l = Leaderboard.create(name: 'My Leaderboard')
l.entries.create(username: 'Jack', score: 10)
l.entries.create(username: 'John', score: 9)
l.entries.create(username: 'Jane', score: 3)
l.entries.create(username: 'June')
