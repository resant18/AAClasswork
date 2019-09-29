# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.destroy_all

cat1 = Cat.create(birth_date: '2015/01/20', color: "brown", name: "Mimi", sex: "F", description: "Browny cat")
cat2 = Cat.create(birth_date: '2014/01/20', color: "black", name: "Blacky", sex: "F", description: "Blacky cat")
cat3 = Cat.create(birth_date: '2017/01/20', color: "yellow", name: "Kitty", sex: "F", description: "Kitty cat")
cat4 = Cat.create(birth_date: '2019/01/20', color: "white", name: "Batman", sex: "F", description: "Batman cat")
cat5 = Cat.create(birth_date: '2011/01/20', color: "orange", name: "Joker", sex: "F", description: "Joker cat")