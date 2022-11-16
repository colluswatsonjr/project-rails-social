# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
puts "📃 Seeding data..."

User.create(username: 'hearLouis', first_name: 'Louis', last_name: 'Garcia', email:'louis.garcia@aol.com', password_digest: 'asd')
User.create(username: 'seeTre', first_name: 'Tre', last_name: 'Garcia', email:'tre.watson@aol.com', password_digest: 'asd')
User.create(username: 'speakCollus', first_name: 'Collus', last_name: 'Collus', email:'collus.watson@aol.com', password_digest: 'asd')

Post.create(user_id: 1, content: "I created this Monday", likes: 22 )
Post.create(user_id: 1, content: "I created this Tuesday", likes: 24 )
Post.create(user_id: 2, content: "I created this Thurday", likes: 26 )
Post.create(user_id: 2, content: "I created this Friday", likes: 100 )
Post.create(user_id: 3, content: "I created this Saturday", likes: 9999 )
Post.create(user_id: 3, content: "I created this Sunday", likes: 01 )

Comment.create(user_id: 1, post_id: 1, content: "I also created this Monday" )
Comment.create(user_id: 1, post_id: 2, content: "I also created this Tuesday" )
Comment.create(user_id: 2, post_id: 3, content: "I also created this Thurday" )
Comment.create(user_id: 2, post_id: 4, content: "I also created this Friday" )
Comment.create(user_id: 3, post_id: 5, content: "I also created this Saturday" )
Comment.create(user_id: 3, post_id: 6, content: "I also created this Sunday" )

puts "✅ Done seeding"
