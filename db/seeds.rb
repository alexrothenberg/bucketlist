# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Todo.delete_all
Todo.create(title: "Hike Tuckerman's Ravine", rating:1, endorsed: true)
Todo.create(title: 'Bike to Turkey Landing',  rating:3, endorsed: true)
Todo.create(title: "Go skydiving")
Todo.create(title: "Eat at Good 'n Plenty",  rating:3, endorsed: true)
