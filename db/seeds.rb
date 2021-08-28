# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Room.create(room_name: 'ゆりルーム',description: 'きれい！',address: '元住吉')
Room.create(room_name: 'えじルーム',description: '沖縄',address: 'うるま市')
Room.create(room_name: 'まさこルーム',description: '大阪',address: '堺市')
