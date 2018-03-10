# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.create([{
    uin: 123000123,
    name: 'Ruth Morris',
    section: 500,
    attempts: 0,
    score: -1,
    last_start: DateTime.strptime("03/10/2018 17:00", "%m/%d/%Y %H:%M"),
    last_end: DateTime.strptime("03/10/2018 20:00", "%m/%d/%Y %H:%M")
}])