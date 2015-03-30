# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




User.create(name: "Alex", email: "alex@email.com", password: "password")
User.create(name: "Ben", email: "ben@email.com", password: "password")
User.create(name: "Braphus", email: "braphus@email.com", password: "password")
User.create(name: "Sarita", email: "sarita@email.com", password: "password", average: 10)

Concept.create(title: "chocolate")
Concept.create(title: "Osama bin Laden")
Concept.create(title: "guns")
Concept.create(title: "George W. Bush")
Concept.create(title: "Democrats")
Concept.create(title: "pizza")
Concept.create(title: "TV")
Concept.create(title: "green tea")
Concept.create(title: "McDonalds")
Concept.create(title: "Europe")
Concept.create(title: "Apple computers")
