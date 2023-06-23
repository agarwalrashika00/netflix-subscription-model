# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.delete_all
users = User.create([{full_name: 'A', email: 'A@gmail.com'}, {full_name: 'B', email: 'B@gmail.com'}, {full_name: 'C', email: 'C@gmail.com'}, {full_name: 'D', email: 'D@gmail.com'}, {full_name: 'E', email: 'E@gmail.com'}])
Subscription.delete_all
subscriptions = Subscription.create([{active: 1, valid_till: 2.months.after}])
