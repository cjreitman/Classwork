# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

Cat.create(name: 'Colin', color: 'gray', birth_date: '1987-05-19', sex: 'M', description: 'Mostly harmless.')
Cat.create(name: 'Chris', color: 'black', birth_date: '1987-11-27', sex: "M")
Cat.create(name: 'Ralph', color: 'gray', birth_date: '2000-01-01', sex: "M", description: "very cuddly")
Cat.create(name: 'Winkie', color: 'calico', birth_date: '2002-03-04', sex: "F", description: "feisty")
Cat.create(name: 'kittykat', color: 'white', birth_date: '2017-12-25', sex: "F")
Cat.create(name: 'whiskers', color: 'striped', birth_date: '1965-09-25', sex: "M", description: "cute")
