require 'faker'
 
exists = true

p = Post.first
i = p.id 


while i < (Post.count + p.id) do
  pt = Post.find(i)

  if (pt.title == "phil's post") && (pt.body == "this is a unique post!")
    exists = false
  else 
    i += 1
  end
  i += 1

end

if exists
    Post.create!(
      title: "phil's post",
      body: "this is a unique post!"
    )
else
end


 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"