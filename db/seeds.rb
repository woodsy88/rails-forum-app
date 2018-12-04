@user = User.create!(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "jon", last_name: "snow")

@user2 = User.create!(email: "test2@test.com", password: "password", password_confirmation: "password", first_name: "andy", last_name: "wee")

@user3 = User.create!(email: "test3@test.com", password: "password", password_confirmation: "password", first_name: "dodo", last_name: "weho")

puts "3 users created"


@forum_thread = ForumThread.create!( subject: "sit amet, consectetur adipiscing elit.",
                                    user_id: @user.id)
                    


@forum_thread2 = ForumThread.create!( subject: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                    user_id: @user.id)


puts "2 forum threads created"                                    

35.times do |post|
  ForumPost.create!( body: "#{post} Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                    user_id: @user.id,
                    forum_thread_id: @forum_thread.id )
end 

puts "35 posts created for forum thread 1"

35.times do |post|
  ForumPost.create!( body: "#{post} Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                    user_id: @user2.id,
                    forum_thread_id: @forum_thread2.id )
                    
end 


puts "35 posts created for forum thread 2"

