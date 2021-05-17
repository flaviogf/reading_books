# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.create title: 'Clean Code', author: 'Robert C. Martin', cover: 'https://via.placeholder.com/133x191', status: :to_read
Book.create title: 'Refactoring', author: 'Martin Fowler', cover: 'https://via.placeholder.com/133x191', status: :reading
Book.create title: 'Extreme Programming', author: 'Vinicius Teles', cover: 'https://via.placeholder.com/133x191', status: :read
